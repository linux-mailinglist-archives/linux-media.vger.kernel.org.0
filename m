Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC663B33C
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2019 12:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389470AbfFJKcl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 06:32:41 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36247 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389466AbfFJKcl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 06:32:41 -0400
Received: by mail-wm1-f66.google.com with SMTP id u8so7641181wmm.1;
        Mon, 10 Jun 2019 03:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=IkG1E0AYyaW7+6Dt1fH+3V0jkXsmdfRM9uUK4jdUh+w=;
        b=Yfo8EUqarFT7nPkF1aeKi1R8SH3rF0IbMaxPFbHD5BQef/cTOgwy1X/WI0zGiITxEX
         jPeF/HOSXo3Qf0jFyOC2mSzVaSnASG/UpSuS2zNVb55CS8hRjSgBFQ9cfOSzDSNxx6Uz
         FT+OBn8OrrCVB4V5V6YCIJhc9gwFGLARBwcGcYxgfn59c630P2IYvl9pFuCdqV4DjsA6
         Sx92LVIpPcRLrdmqe444Idcck7Dgj09/ZSurEmcgyIGeQs1LYorx0pA5P03Vv8gQH62n
         YIO1lG/oVeF0n4VkBxQQpD3JJa8tpu5TlY9a+Dj0ZxaST59vZwZRjsopxlD6YKsLcyMG
         eBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=IkG1E0AYyaW7+6Dt1fH+3V0jkXsmdfRM9uUK4jdUh+w=;
        b=IV56IsLGIQe/eNYAH7F83YHPxLq6EKdeBHZ5yru3bQ48HPrnwOs7iJnerMxBvXG2r0
         KmY7KS5vbhamg/PEmQyi2uUKV6AJuFJLkhihGy4FQlLQcv3p/lBhoDCevHhPMGLoeIgi
         9VhBrHjZcbx9+gr1/fwtNlJT2WXnXmVlmY5EZE/G5FjaiAqlqnmb5Mi/ijZE5uHWjvJ2
         4g6f3tJeI7kbQog+1fkvpml6t52Jt9zLLYvWAC6lG0irlndho1VeuoYXccWgmRv+iqn0
         YNwgX1PFr4jwU1tUM3Wp19bK+fq/bC2198gZzdgnyE4/PiWLtuh+vmKrlLjJKqUoyfCv
         i0pw==
X-Gm-Message-State: APjAAAVfUHV+03nnJSjguR7Js7p4IeGvTfvVOYbQSuM6bmJ3eEqpxXz1
        pysbyYm+MqGGyzd7mB5+xlk=
X-Google-Smtp-Source: APXvYqzibcwpB846QHozkg6IQp2B/oYTBKhsZYSYuuwjsqFbx1LuXZFZoi9TZb/x6Ii+Fr9hHWLjGA==
X-Received: by 2002:a1c:7a10:: with SMTP id v16mr13435253wmc.98.1560162759118;
        Mon, 10 Jun 2019 03:32:39 -0700 (PDT)
Received: from arch-late ([87.196.73.9])
        by smtp.gmail.com with ESMTPSA id o15sm12661526wrw.42.2019.06.10.03.32.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 10 Jun 2019 03:32:38 -0700 (PDT)
References: <20190606153825.8183-1-sebastien.szymanski@armadeus.com> <20190606153825.8183-2-sebastien.szymanski@armadeus.com> <92ca6e6e-2ebd-cec4-4f75-2674fd2c3d99@infradead.org>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     driverdev-devel@linuxdriverproject.org
Cc:     =?utf-8?Q?S=C3=A9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH v2 2/3] media: imx7-media-csi: add i.MX6UL support
In-reply-to: <92ca6e6e-2ebd-cec4-4f75-2674fd2c3d99@infradead.org>
Date:   Mon, 10 Jun 2019 11:32:36 +0100
Message-ID: <m336khpw6z.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Randy,
On Fri 07 Jun 2019 at 00:10, Randy Dunlap wrote:
> On 6/6/19 8:38 AM, S=C3=A9bastien Szymanski wrote:
>> i.MX7 and i.MX6UL/L have the same CSI controller. So add i.MX6UL/L suppo=
rt
>> to imx7-media-csi driver.
>>
>> Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.co=
m>
>> ---
>>
>> Changes for v2:
>>  - rebase on top of linuxtv/master
>>  - mention i.MX6UL/L in header and Kconfig help text
>>  - rename csi_type to csi_soc_id
>>
>>  drivers/staging/media/imx/Kconfig          |  4 +-
>>  drivers/staging/media/imx/imx7-media-csi.c | 62 ++++++++++++++++------
>>  2 files changed, 49 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/i=
mx/Kconfig
>> index ad3d7df6bb3c..8b6dc42c39e0 100644
>> --- a/drivers/staging/media/imx/Kconfig
>> +++ b/drivers/staging/media/imx/Kconfig
>> @@ -22,11 +22,11 @@ config VIDEO_IMX_CSI
>>  	  A video4linux camera sensor interface driver for i.MX5/6.
>>
>>  config VIDEO_IMX7_CSI
>> -	tristate "i.MX7 Camera Sensor Interface driver"
>> +	tristate "i.MX6UL/L / i.MX7 Camera Sensor Interface driver"
>>  	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
>>  	default y
>
> Hi,
> I realize that this "default y" is not part of this patch set, but we have
> pretty strong guidance that a driver should not default to 'y' unless it =
is
> needed for a system to boot.  If this driver is optional, then please drop
> the 2 occurrences of "default y" in this Kconfig file.

Yeah, even though both depends on imx_media, I agree that they
should not default to y. I will send a patch for this.
Thanks.

---
Cheers,
        Rui


>
> thanks.
>>  	help
>>  	  Enable support for video4linux camera sensor interface driver for
>> -	  i.MX7.
>> +	  i.MX6UL/L or i.MX7.
>>  endmenu
>>  endif

