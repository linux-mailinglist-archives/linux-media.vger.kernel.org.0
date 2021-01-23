Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83FDE30159F
	for <lists+linux-media@lfdr.de>; Sat, 23 Jan 2021 15:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbhAWOCJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Jan 2021 09:02:09 -0500
Received: from chalk.uuid.uk ([51.68.227.198]:42720 "EHLO chalk.uuid.uk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbhAWOCI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Jan 2021 09:02:08 -0500
X-Greylist: delayed 618 seconds by postgrey-1.27 at vger.kernel.org; Sat, 23 Jan 2021 09:02:08 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=octiron.net
        ; s=20180214; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc
        :MIME-Version:Content-Type:Content-Disposition:Content-Transfer-Encoding:
        In-Reply-To:References; bh=i7g3Ugq/V83Pqow0ZjvGhs8/NKJs4SQd0qB84kIV5Mo=; b=vO
        5+voNpOmPiNglUmDDE3GFL/Dz6R/bZ6yEOEvpFi70aL5S8nh6+H0QDP9wr6vgcJbnttcahQOjU0cv
        ADkKR2vQ8IEe2Fb4BJead4gXPS+dYaZkmNJxegyE1PBmXeZVxcRtr+G7Gvsvf9cEPgBdj0QtYBieK
        9AR9BloTsgMqcViTBR93azgr/gG36M3nbO1+nmOUHeWpyYgzWhEZAz8uLPYmDusaiwydyp0B8GCoo
        QIzEMw8Jl5WGfJ3A3Cxu8l6oSvmYFI06W76PkHmpnola+G5Hdbb+BkdhHOeQ9eQDEZZZedYxyRT6p
        B4uAVBQa8xjZqM+1uY4nVkmy6w9CDHQQ==;
Received: by chalk.uuid.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <v4l@octiron.net>)
        id 1l3JJh-0001uD-NB
        for linux-media@vger.kernel.org; Sat, 23 Jan 2021 13:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=octiron.net
        ; s=20180214; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc
        :MIME-Version:Content-Type:Content-Disposition:Content-Transfer-Encoding:
        In-Reply-To:References; bh=i7g3Ugq/V83Pqow0ZjvGhs8/NKJs4SQd0qB84kIV5Mo=; b=vO
        5+voNpOmPiNglUmDDE3GFL/Dz6R/bZ6yEOEvpFi70aL5S8nh6+H0QDP9wr6vgcJbnttcahQOjU0cv
        ADkKR2vQ8IEe2Fb4BJead4gXPS+dYaZkmNJxegyE1PBmXeZVxcRtr+G7Gvsvf9cEPgBdj0QtYBieK
        9AR9BloTsgMqcViTBR93azgr/gG36M3nbO1+nmOUHeWpyYgzWhEZAz8uLPYmDusaiwydyp0B8GCoo
        QIzEMw8Jl5WGfJ3A3Cxu8l6oSvmYFI06W76PkHmpnola+G5Hdbb+BkdhHOeQ9eQDEZZZedYxyRT6p
        B4uAVBQa8xjZqM+1uY4nVkmy6w9CDHQQ==;
Received: by tsort.uuid.uk with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.90_1)
        (envelope-from <v4l@octiron.net>)
        id 1l3JJd-0006Bq-28
        for linux-media@vger.kernel.org; Sat, 23 Jan 2021 13:51:04 +0000
To:     linux-media@vger.kernel.org
From:   Simon Arlott <v4l@octiron.net>
Subject: [PATCH 1/2] libdvbv5: Read all "other" PIDs for channels
X-Face: -|Y&Xues/.'(7\@`_\lFE/)pw"7..-Ur1^@pRL`Nad5a()6r+Y)18-pi'!`GI/zGn>6a6ik
 mcW-%sg_wM:4PXDw:(;Uu,n&!8=;A<P|QG`;AMu5ypJkN-Sa<eyt,Ap3q`5Z{D0BN3G`OmX^8x^++R
 Gr9G'%+PNM/w+w1+vB*a($wYgA%*cm3Hds`a7k)CQ7'"[\C|g2k]FQ-f*DDi{pU]v%5JZm
Message-ID: <da8f5aa8-e413-1678-d93d-6e8d20fb97b6@0882a8b5-c6c3-11e9-b005-00805fc181fe>
Date:   Sat, 23 Jan 2021 13:51:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When there are multiple PID_* entries in the channels file, keep all of
them instead of only the last one.

Signed-off-by: Simon Arlott <v4l@octiron.net>
---
 lib/libdvbv5/dvb-file.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/lib/libdvbv5/dvb-file.c b/lib/libdvbv5/dvb-file.c
index 866e4c6c..68265f4e 100644
--- a/lib/libdvbv5/dvb-file.c
+++ b/lib/libdvbv5/dvb-file.c
@@ -670,21 +670,18 @@ static int fill_entry(struct dvb_entry *entry, char *key, char *value)
 		if (!type)
 			return 0;
 
-		len = 0;
-
 		p = strtok(value," \t");
 		if (!p)
 			return 0;
 		while (p) {
 			entry->other_el_pid = realloc(entry->other_el_pid,
-						      (len + 1) *
+						      (entry->other_el_pid_len + 1) *
 						      sizeof (*entry->other_el_pid));
-			entry->other_el_pid[len].type = type;
-			entry->other_el_pid[len].pid = atol(p);
+			entry->other_el_pid[entry->other_el_pid_len].type = type;
+			entry->other_el_pid[entry->other_el_pid_len].pid = atol(p);
 			p = strtok(NULL, " \t\n");
-			len++;
+			entry->other_el_pid_len++;
 		}
-		entry->other_el_pid_len = len;
 	}
 
 	if (!is_video && !is_audio) {
-- 
2.17.1

-- 
Simon Arlott
