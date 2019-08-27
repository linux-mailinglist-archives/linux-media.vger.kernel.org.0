Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2EEC9E925
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 15:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbfH0NWk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 09:22:40 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48742 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfH0NWk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 09:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6eBvcnLs/eCyS4KaKn57JkKTaMr5nBFGDdXlvxP/2Pw=; b=TL/tht4T193YvnIFp+9/fBHRJ
        SgLCrPTyVZ6cYtWYwNdu3ck6xTmlhZCPZdvI3J01flZAbT6X9zTN9kl+5TGAz7XSJnqBz+x0+xUJA
        aVTi/8c15LnzR3Uf01WOlpm0/5lnDbBqCNPLqIkd45jHQ29kWlyg04YIajZmkKASB/Iu/jOPCpQ/7
        CNqrWQH2YAfEwu+r5KddS5Q9QGgoK79FowwSDxn7+iR4OrgNN6rcluCIEH0U+UR1AFTHswuiq9lgM
        z/2vYJS9siXcQ80gzOWj25Je38y5FeBDBqSE2/V39IEfsPYnFC0sKgoyz044Jh9V5QQtiwuIc2ecR
        I3qRA371g==;
Received: from 177.17.135.157.dynamic.adsl.gvt.net.br ([177.17.135.157] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i2bQl-0007Hy-Ox; Tue, 27 Aug 2019 13:22:39 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i2bQj-0001NU-CH; Tue, 27 Aug 2019 10:22:37 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Olcay Korkmaz <olcay.krkmz@gmail.com>
Subject: [PATCH] libdvbv5: Don't assume that NIT table was parsed
Date:   Tue, 27 Aug 2019 10:22:34 -0300
Message-Id: <20190827132234.5252-1-mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It might happen that the NIT table doesn't get parsed.

As reported by Olcay, some transponders at Turksat-42.0E seem
to be missing the NIT table, causing dvb tools to crash with:

	Program received signal SIGSEGV, Segmentation fault.
	dvb_store_channel (dvb_file=0x7fffffffe460, __p=0x5555555605d0, dvb_scan_handler=0x555555565060, get_detected=0,
	    get_nit=0) at dvb-file.c:1345
	1345			if (dvb_scan_handler->nit->transport) {

As both transport ID and network ID are optional information,
verify if the nit table was parsed before trying fill them.

Reported-by: Olcay Korkmaz <olcay.krkmz@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 lib/libdvbv5/dvb-file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libdvbv5/dvb-file.c b/lib/libdvbv5/dvb-file.c
index d077271a6546..474b59cb6fce 100644
--- a/lib/libdvbv5/dvb-file.c
+++ b/lib/libdvbv5/dvb-file.c
@@ -1342,7 +1342,7 @@ int dvb_store_channel(struct dvb_file **dvb_file,
 			dvb_log(_("Storing as channel %s"), channel);
 		vchannel = dvb_vchannel(parms, dvb_scan_handler->nit, service->service_id);
 
-		if (dvb_scan_handler->nit->transport) {
+		if (dvb_scan_handler->nit && dvb_scan_handler->nit->transport) {
 			network_id = dvb_scan_handler->nit->transport->network_id;
 			transport_id = dvb_scan_handler->nit->transport->transport_id;
 		}
-- 
2.21.0

