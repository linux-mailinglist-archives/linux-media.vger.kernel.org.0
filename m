Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3B8E5FFE
	for <lists+linux-media@lfdr.de>; Sun, 27 Oct 2019 01:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbfJZXQ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Oct 2019 19:16:26 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39350 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfJZXQ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Oct 2019 19:16:26 -0400
Received: by mail-qt1-f195.google.com with SMTP id t8so9009114qtc.6;
        Sat, 26 Oct 2019 16:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=WembGSFsbExOh6C9xfy35r52QdLc1q9Nu1Ae4G7IdBI=;
        b=pWkyQ1NGQb6iIZ8q127AjyQtavlLiCaXvTaXTDBO605b0pyxYH/oqDhLauXmQy1r6d
         VzLdCYj3DxDE6D1V3JbJF2UC/geCDPQnkm+xCwH5Ddh0S4Bn2iHlFrXH2SkAVRYo+7N8
         5Qg8AJJjFZzJJLotYEeOqLmfjvTJd6Sfx+9WABWk/eq2uRTR/w7HsohxUPcNAmopzbFx
         VLY2hDEc1rkIXyrd94xHlmVyYWMKbVU+LsRdJ+lojihb9lV4nbEdMDShmQKc8G/J1+H6
         jywm2KLrcgVXe+hENXm7oNZUwxzpYerV5u1zrurD9flBrdnhcHmWqXIXXWzwLrFxrGxG
         UJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=WembGSFsbExOh6C9xfy35r52QdLc1q9Nu1Ae4G7IdBI=;
        b=ukVeVFHH7x6Wl60BqQWJTebmmhd22DFo2zVO8b5cyqCCM7s6UwKSn2W3awvIQYpMQ8
         Iv95XO6tzuFazodGG0uigfpb1w7bjEaoZ/bl3CUJefQqzS/JfbhQAay3LaVB/Es4pmT0
         LCwJ+4ujys21uivLvI+doeKEXnLNMM0zeq3BA7EYafL/nVCPhRreNYyQ2qNIn9EzeaDF
         ul2M1W8QIhKX6/8Q5nR3vVTIJ2BpMKbKwH0Nru48PjxC0OLSz6scxaHSwtN3OnEwB+zd
         XbCn7g32lQg00rUEg+ijucoorAQ24uwoNl49Gym1lLONA+L7ubnpriYFIg7d4fJbHJGX
         cHEg==
X-Gm-Message-State: APjAAAUHDBL/PxhEo+SSfiiAV+kCXr4nsXkgyluWHonSMYZkBliamCmy
        ALy6DE3oyFaaatt77yK5CAQ=
X-Google-Smtp-Source: APXvYqyJ5t2Ti+9RF911OfbntRMNRgN1W+sncXLrr/XZccWG7OXIn9o2GpwwABGpr4uZJtsA+5RqDw==
X-Received: by 2002:a0c:a947:: with SMTP id z7mr10744288qva.103.1572131785586;
        Sat, 26 Oct 2019 16:16:25 -0700 (PDT)
Received: from cristiane-Inspiron-5420 ([131.100.148.220])
        by smtp.gmail.com with ESMTPSA id t58sm3999075qta.78.2019.10.26.16.16.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 26 Oct 2019 16:16:25 -0700 (PDT)
Date:   Sat, 26 Oct 2019 20:16:19 -0300
From:   Cristiane Naves <cristianenavescardoso09@gmail.com>
To:     outreachy-kernel@googlegroups.com
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: allegro-dvt: remove bool comparison
Message-ID: <20191026231619.GA14093@cristiane-Inspiron-5420>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bool tests don't need comparisons. Issue found by coccicheck.

Signed-off-by: Cristiane Naves <cristianenavescardoso09@gmail.com>
---
 drivers/staging/media/allegro-dvt/nal-h264.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/allegro-dvt/nal-h264.c b/drivers/staging/media/allegro-dvt/nal-h264.c
index 4e14b77..bd48b88 100644
--- a/drivers/staging/media/allegro-dvt/nal-h264.c
+++ b/drivers/staging/media/allegro-dvt/nal-h264.c
@@ -235,7 +235,7 @@ static inline int rbsp_write_bit(struct rbsp *rbsp, bool value)
 
 	rbsp->pos++;
 
-	if (value == 1 ||
+	if (value ||
 	    (rbsp->num_consecutive_zeros < 7 && (rbsp->pos % 8 == 0))) {
 		rbsp->num_consecutive_zeros = 0;
 	} else {
-- 
2.7.4

