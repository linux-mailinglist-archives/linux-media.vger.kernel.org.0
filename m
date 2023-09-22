Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A15997AB15A
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 13:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233709AbjIVLz2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 07:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjIVLz1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 07:55:27 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0E3100
        for <linux-media@vger.kernel.org>; Fri, 22 Sep 2023 04:55:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1qjekh-0000wh-TW; Fri, 22 Sep 2023 13:55:19 +0200
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <mtr@pengutronix.de>)
        id 1qjekh-0089V0-Ch; Fri, 22 Sep 2023 13:55:19 +0200
Received: from mtr by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1qjekh-00AxJZ-AS; Fri, 22 Sep 2023 13:55:19 +0200
Date:   Fri, 22 Sep 2023 13:55:19 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 1/7] media: allegro-dvt: increase buffer size in
 msg_type_name()
Message-ID: <20230922115519.GC2564188@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
References: <20230922105036.3148784-1-hverkuil-cisco@xs4all.nl>
 <20230922105036.3148784-2-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230922105036.3148784-2-hverkuil-cisco@xs4all.nl>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 22 Sep 2023 12:50:30 +0200, Hans Verkuil wrote:
> Fixes this compile error
> 
> drivers/media/platform/allegro-dvt/allegro-mail.c: In function 'msg_type_name':
> drivers/media/platform/allegro-dvt/allegro-mail.c:37:48: warning: '%04x' directive output may be truncated writing between 4 and 8 bytes into a region of size 6 [-Wformat-truncation=]
>    37 |                 snprintf(buf, sizeof(buf), "(0x%04x)", type);
>       |                                                ^~~~
> drivers/media/platform/allegro-dvt/allegro-mail.c:37:44: note: directive argument in the range [1, 4294967295]
>    37 |                 snprintf(buf, sizeof(buf), "(0x%04x)", type);
>       |                                            ^~~~~~~~~~
> drivers/media/platform/allegro-dvt/allegro-mail.c:37:17: note: 'snprintf' output between 9 and 13 bytes into a destination of size 9
>    37 |                 snprintf(buf, sizeof(buf), "(0x%04x)", type);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/allegro-dvt/allegro-mail.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/allegro-mail.c
> index 16effad10746..aadc947a77ae 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-mail.c
> +++ b/drivers/media/platform/allegro-dvt/allegro-mail.c
> @@ -16,7 +16,7 @@
>  
>  const char *msg_type_name(enum mcu_msg_type type)
>  {
> -	static char buf[9];
> +	static char buf[13];
>  
>  	switch (type) {
>  	case MCU_MSG_TYPE_INIT:
> -- 
> 2.40.1
> 
> 
