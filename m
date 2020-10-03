Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1229A282352
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 11:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbgJCJsy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 05:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgJCJsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Oct 2020 05:48:54 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9B0C0613D0
        for <linux-media@vger.kernel.org>; Sat,  3 Oct 2020 02:48:52 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k15so4367904wrn.10
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2020 02:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=NPLK7php6gd5q1nGrm86vNUGuvyB4QsaucbK0XhFoRs=;
        b=EpfP2AL8Ku+8X5lL++o3EQLGtvcg5jFMpzEKqwwJWTKDHhvBt6T+Gthk63BGz/G0DG
         66f/vuNFyNkW1V3upflBHDQkGDgEsxNyvYJu7EeHS0jZFzRt2Sdm2qYIp1ic8FXcS+0T
         ncU4hb22TqZMV+siITnMir5aU9EdwUDYbarjeBDUcLuIMBzl6PzjepugnVilweZAACiP
         bNdR9B4ioWVoRhZBZEAmlERCum+RiO6jHt2xfHWkndVtbYlKDSKqyZQp5aB17tSyn5Yn
         1s1GJ4+WAztXwRInMECB+79i0bUfpOMH9lhu3HtLq7J+BKplvqolYEVBEnjjkoYPHKSY
         iICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=NPLK7php6gd5q1nGrm86vNUGuvyB4QsaucbK0XhFoRs=;
        b=BlyXzxC2kdLRBF0ZPrlcAOQ5rEPsquAET3YxkAdfSmTOa4LQ3hnkh5wX/miUSYaU1w
         0J0AaC/qfD3BVNPAwEShDNLH8Z84wOGpIR9M4R5X0+amUn/jaYlMukhTXvNOmy2106q3
         Tyy90l1aOdxyvZLR/pWYNr/s5gpGGddBxzMi82xhwebVwmgPYMb8wc41PkX3sMTVp18v
         g1ZXofeR1NLYyU1RNgw4rU6+WoNuy/xfuggEDBX52UB+vvCkjc76LrbDLrinxRU0MREf
         7U6cpD6geJmV9hJ1MwFmgBxZfNZCVn8YWI3kHWLAUO+OpLLqI7zINV1UdSTQfD3fKWpM
         ZPzQ==
X-Gm-Message-State: AOAM530o8z8YnlWy836VWX9ybO4PBjZK8UQ6y5AlmI3vC9fH3Uo/jzjg
        +7qNk8DySQaEoloSQJAfMRaG+LeCPOY=
X-Google-Smtp-Source: ABdhPJxbe89W9BeiE5YeAQ2qHrbuzUz89YwkTaw2yl+exL9Z+9ZWkM6GN4BWB3p5nub5gyCoBKlq6w==
X-Received: by 2002:a5d:444b:: with SMTP id x11mr7414966wrr.402.1601718531219;
        Sat, 03 Oct 2020 02:48:51 -0700 (PDT)
Received: from [192.168.43.227] ([185.69.145.159])
        by smtp.gmail.com with ESMTPSA id u17sm5318109wri.45.2020.10.03.02.48.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 02:48:50 -0700 (PDT)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Malcolm Priestley <tvboxspy@gmail.com>
Subject: [PATCH] media: lmedm04: Remove lme2510_kill_urb function.
Message-ID: <569c15d7-3e16-1e0c-d300-76f638e0eadb@gmail.com>
Date:   Sat, 3 Oct 2020 10:48:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From fcc79b4b8eae97bc989b200e56004f1ed3bb62f8 Mon Sep 17 00:00:00 2001
From: Malcolm Priestley <tvboxspy@gmail.com>
Date: Mon, 24 Aug 2020 22:42:23 +0100
Subject: [PATCH] media: lmedm04: Remove lme2510_kill_urb function.

This function is not necessary and largely a remnant of
dvb-usb workaround and is now controlled by dvb-usb-v2.

Signed-off-by: Malcolm Priestley <tvboxspy@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/lmedm04.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index 0f5a1eed5ea9..d0672aed3bfe 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -751,20 +751,6 @@ static const char *lme_firmware_switch(struct dvb_usb_device *d, int cold)
 	return fw_lme;
 }
 
-static int lme2510_kill_urb(struct usb_data_stream *stream)
-{
-	int i;
-
-	for (i = 0; i < stream->urbs_submitted; i++) {
-		deb_info(3, "killing URB no. %d.", i);
-		/* stop the URB */
-		usb_kill_urb(stream->urb_list[i]);
-	}
-	stream->urbs_submitted = 0;
-
-	return 0;
-}
-
 static struct tda10086_config tda10086_config = {
 	.demod_address = 0x0e,
 	.invert = 0,
@@ -1198,11 +1184,6 @@ static int lme2510_get_rc_config(struct dvb_usb_device *d,
 static void lme2510_exit(struct dvb_usb_device *d)
 {
 	struct lme2510_state *st = d->priv;
-	struct dvb_usb_adapter *adap = &d->adapter[0];
-
-	if (adap != NULL) {
-		lme2510_kill_urb(&adap->stream);
-	}
 
 	if (st->lme_urb) {
 		usb_kill_urb(st->lme_urb);
-- 
2.27.0
