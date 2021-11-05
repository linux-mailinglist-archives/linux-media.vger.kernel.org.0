Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8437A4460A6
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 09:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbhKEIat convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 5 Nov 2021 04:30:49 -0400
Received: from comms.puri.sm ([159.203.221.185]:42610 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232716AbhKEIas (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Nov 2021 04:30:48 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 1065EE0222;
        Fri,  5 Nov 2021 01:28:09 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vqTgRI8eWZ4E; Fri,  5 Nov 2021 01:28:06 -0700 (PDT)
Date:   Fri, 05 Nov 2021 09:28:01 +0100
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] hi846: Drop of_match_ptr() from OF device ID list
In-Reply-To: <20211105082250.849743-1-sakari.ailus@linux.intel.com>
References: <20211105082250.849743-1-sakari.ailus@linux.intel.com>
Message-ID: <7C3DD0CE-EA5B-4715-9B63-7AFE0A877237@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 5. November 2021 09:22:50 MEZ schrieb Sakari Ailus <sakari.ailus@linux.intel.com>:
>The compatible strings can also be used on ACPI so drop of_match_ptr()
>macro. This also fixes a compiler warning when the driver is compiled
>without OF support.
>
>Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Signed-off-by: Martin Kepplinger <martink@posteo.de>
but this is also part of https://lore.kernel.org/linux-media/20211019155509.1018130-1-martin.kepplinger@puri.sm/ just fyi



>---
> drivers/media/i2c/hi846.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
>index 822ce3021fde..cf61c22f6125 100644
>--- a/drivers/media/i2c/hi846.c
>+++ b/drivers/media/i2c/hi846.c
>@@ -2176,7 +2176,7 @@ static struct i2c_driver hi846_i2c_driver = {
> 	.driver = {
> 		.name = "hi846",
> 		.pm = &hi846_pm_ops,
>-		.of_match_table = of_match_ptr(hi846_of_match),
>+		.of_match_table = hi846_of_match,
> 	},
> 	.probe_new = hi846_probe,
> 	.remove = hi846_remove,
