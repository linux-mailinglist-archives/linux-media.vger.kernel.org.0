Return-Path: <linux-media+bounces-55949-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIzuGXYzuGmvaAEAu9opvQ
	(envelope-from <linux-media+bounces-55949-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:44:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E8E29D970
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 17:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2C683094607
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 16:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E733CCFCE;
	Mon, 16 Mar 2026 16:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="aGMyhxy3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792473B7B76
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679157; cv=pass; b=thufRRY+gaqeKvkl7kN2cMWjsi4i+uFB0Cf+e8TPOOQWqWdRZG5cu5WFX671izn36AHswrkNjdDRP+lxRUU1yysZ/6+iFKsGfLp/YaBprVxFAshpqmDqIcrQG0jAe1FXTFHad4pE3lXe7Soq1I7qusNZ9tztwhf0PzbN5B6piV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679157; c=relaxed/simple;
	bh=MZ+KoRXN4ev5zgq1TYjXx+27Job++VERaqTx+cqJigc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdJ4/zG7Ar34lpmitPKavIc1l+ovBLUpEyahz9v+rfdEsS509QEYNonp7/iYxLwewHjE/tAhm5hpfsMnuSlgoi1btZLv/EGtqEUq0vCmL81j+XNkMH22TfP+R2WIEVnhjBFA2+egVYKBLMCmsimdrxypVWkmWeYIseGF1zHkRP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=aGMyhxy3; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a725a14e3so43300841fa.0
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 09:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773679150; cv=none;
        d=google.com; s=arc-20240605;
        b=QpeQBIjLavA+dlrxKlzCAgSBLc+B/751GdhYVXyVlXgpmRjgd/AGCgGLR+SiYR3mZK
         h1K8KbhOqdkwlUWQ5qgbRQ94WaYuYg1nsGu+Qc8sKEOLfpn6Wh6lZgSCVW1fh5wBcOkr
         W4VdNFWECLDWoMkZJrLZ4qYOm6jmXFRE7FPmeFqRxl5ZGzGo+XtmjFCOD5f4fslRk64j
         dujDXixYfcb3I+CSVe13WWDSZbwo53W0Yq7HPYIpHNeq7YLuJL/6d7j4ewlAP958Y2cT
         qIUe5KwwrmmHAZZ9CmqXEZ3b0PhjmwlbsHIxBzOotbWQIxoPd1uz1gjtWmTmdiAJmnPx
         z1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wzwElw/IlWYKyiERo710yqMeeALQ6cqAdnqlMgaNdWM=;
        fh=rrdBpk38zNj4IVPpzlHLAw7asTTQlLQz81ZYDR9Bt/Y=;
        b=VB7R8Kc7f8Fj6LQEEouoQAilZ8smt8dE6JfaF1sSzmGYmd0uu2vg1dq5bS+nQEg8aI
         UKIRlT0fmEYLIC1SrOx5bAoLJe9LNKM2TBqYZlpyxMttYruCS6Rmxvp5moDi/W16j25p
         zDVVDqIRzuxwvY5tykXKFVzPTMsRAxu32TXi/4/fB40Yi3Go9G/gZAXFqm31M87ohzX8
         muT+KUChQsV9ECVZnvRnPBfhxxc0e3PTuYw4/PLOXNMQYIP1BBROoPUIafrgOFiEkItV
         FyMQs/rrTBXFgRcFd0p4jcfoe9vfOSBbZ5SbbY6nKz1JcoGv71qAYA5d+TDiLoWrkGlN
         jR1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1773679150; x=1774283950; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wzwElw/IlWYKyiERo710yqMeeALQ6cqAdnqlMgaNdWM=;
        b=aGMyhxy3mbG66aOZmYTAbIpKpBWd/Lzc3NH/z/mauH0aL+kC9c+9uPuurCy+laNVey
         6F91t+0YfWRA8SWWFTM85DqrWWgoQT6Pff7QzlSD1JJOkrzHjksZtqEVBo7aoTkkg2Rf
         C+N8swxqT2DdJK+cHxUgMjGocpO7tjjtEXSuK4Nz88OibOD2PHXpMf1aTsR+nzkXkij/
         B8Ox2ou7xIhsyvCtFFjwbGoQbvs/GNuuCAw7ERfisdTLwpXmwZWZ2IZmrlRriYFFnF/d
         civBMjrRUoDOESFYtoI8mrCTRqz4571AAM67uUBB09m84NrabNk4yG6rM6e3ZE5lWm9w
         iWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773679150; x=1774283950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzwElw/IlWYKyiERo710yqMeeALQ6cqAdnqlMgaNdWM=;
        b=Iyq7LmqcN6qy+/6BZni3A9kcaTquqYFMli8iuLHF6xyw8CG/ofl3/b+fmmGngy5AkB
         uS1lgrTZR1xXfR/NqJKZ1w9uqpClY+eyCR2vTuhQpa9DLHQYBaV+qTUS73NGKW+e5z7S
         WPUI7pMNwFRiRSXgVgrhEcoOgRkpGULnfPqQtBaT/MCtxiEcUb7QqeqrqIhLj8SuXsfo
         1Qt1bvlWu/1uRgr11Ktq5DaleGNUS531p7y7GwIzWClxivNjCeysD82QuZ8gqkpMFMN7
         zc2EC/tkDQyqym9gBL7uhbyua6FFJEpwGG0kRNPjQ3bICd2E/aJcbnmXBYmVLarsVJ3/
         w/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf4M3UR4MmMPJ4Gv5m7vGkXV7VYjbeYLwu2eMzHu97ZTu0P2XSBj5sgij5ob7qAly3iwAUZAJotHl5lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNKyv8H9DuRRKnKgzUfLtTLIdGN8ZKt9bep7RKmyVoHdmrs8hX
	b50Dd6DNw54LwmSuuaA102yh1G01xFDPjG2IIUPUmcJJ5akKt7JDTc7m1+i9BtiPHv0Z+wHP067
	1rLw1Kc7tSWvIL0CO41iZGfcWQmmoyrMwtCXSfsc5Bg==
X-Gm-Gg: ATEYQzwGipW0uvdJzP4I+UKUstAKnK28tjchWeFJkKjhdla2oOn7vTqOtL5df0fnLqG
	HLWIL41I5r4lTj7mvNcQPINZlStL+/O3Z+VXHyNqg1GuBgMMihUz2V7ZgE9K9VaSkIEMztnpk5Z
	IoguJGadbtrpUWuNFxk1vylor1S9doaSQxDRMt9C207x8NWAS9bmtU/8v8SWaoHQ2bp+ysdLG+F
	reJdXKpAOspSGgBeYzliAPoPfSL1jQ9+axwLerRz7MZ5a5IZ/xrPRGlSWObI0H1DzlUfsbeC5Cv
	KiNZ5Ta15cMZxxEHcVSQPUNbZ4OvV5tcrWFLh78=
X-Received: by 2002:a05:651c:12c6:b0:37f:8332:6ae0 with SMTP id
 38308e7fff4ca-38a897d58aemr45338481fa.33.1773679150172; Mon, 16 Mar 2026
 09:39:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316090558.1537823-1-xiaolei.wang@windriver.com>
In-Reply-To: <20260316090558.1537823-1-xiaolei.wang@windriver.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 16 Mar 2026 16:38:51 +0000
X-Gm-Features: AaiRm527pAgNsYdHRhSxuwu4aLFDsVcMjFhtLNxwKPEtHMmwNvNJ6m6XjAVbdI4
Message-ID: <CAPY8ntAmtXVwi0B8QXtzDKf0RrEc8fDOhVf662=dnT3h2oZ+iw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov9282: Add test pattern control
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	tarang.raval@siliconsignals.io, jacopo@jmondi.org, mchehab@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org, 
	johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl, 
	jai.luthra@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55949-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 10E8E29D970
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Xiaolei

On Mon, 16 Mar 2026 at 09:06, Xiaolei Wang <xiaolei.wang@windriver.com> wrote:
>
> This adds V4L2_CID_TEST_PATTERN control support.
>
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/media/i2c/ov9282.c | 47 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 2167fb73ea41..f64b2084b8e7 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -104,6 +104,12 @@
>  #define OV9282_REG_STROBE_FRAME_SPAN           CCI_REG32(0x3925)
>  #define OV9282_STROBE_FRAME_SPAN_DEFAULT       0x0000001a
>
> +/* Test Pattern registers */
> +#define OV9282_REG_TEST_PATTERN_BAR    CCI_REG8(0x5e00)
> +#define OV9282_TEST_PATTERN_BAR_EN     BIT(7)
> +#define OV9282_REG_TEST_PATTERN_SOLID  CCI_REG8(0x4320)
> +#define OV9282_TEST_PATTERN_SOLID_EN   BIT(1)
> +
>  /* Input clock rate */
>  #define OV9282_INCLK_RATE      24000000
>
> @@ -462,6 +468,18 @@ static const struct ov9282_mode supported_modes[] = {
>         },
>  };
>
> +enum {
> +       OV9282_TEST_PATTERN_DISABLED,
> +       OV9282_TEST_PATTERN_COLOR_BAR,

This feels like an odd name to choose seeing as it is only a
monochrome sensor so there is no color.

> +       OV9282_TEST_PATTERN_SOLID_COLOR,
> +};
> +
> +static const char * const ov9282_test_pattern_menu[] = {
> +       "Disabled",
> +       "Color Bar",
> +       "Solid Color",
> +};
> +
>  /**
>   * to_ov9282() - ov9282 V4L2 sub-device to ov9282 device.
>   * @subdev: pointer to ov9282 V4L2 sub-device
> @@ -586,6 +604,23 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
>         return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
>  }
>
> +static int ov9282_set_ctrl_test_pattern(struct ov9282 *ov9282, int pattern)
> +{
> +       int ret;
> +
> +       ret = cci_update_bits(ov9282->regmap, OV9282_REG_TEST_PATTERN_BAR,
> +                             OV9282_TEST_PATTERN_BAR_EN,
> +                             pattern == OV9282_TEST_PATTERN_COLOR_BAR ?
> +                             OV9282_TEST_PATTERN_BAR_EN : 0, NULL);

This register is never written from anywhere else, and all the bits
are related to the test pattern, so is there any reason not to set
them all?

> +       if (ret)
> +               return ret;
> +
> +       return cci_update_bits(ov9282->regmap, OV9282_REG_TEST_PATTERN_SOLID,
> +                              OV9282_TEST_PATTERN_SOLID_EN,
> +                              pattern == OV9282_TEST_PATTERN_SOLID_COLOR ?
> +                              OV9282_TEST_PATTERN_SOLID_EN : 0, NULL);

Again no need to use cci_update_bits as all the bits relate to the test pattern.

If you're adding black, then you could add white as well.
Registers 0x4322-0x4329 set the 4 pixel values that would equate to
V4L2_CID_TEST_PATTERN_RED, etc, so writing them all as
CCI_REG16(0x4322, 0x3ff) and repeating for 0x4324, 0x4326, and 0x4328
would give you white.
Then again the only mechanism for implementing that is to use
V4L2_CID_TEST_PATTERN_RED etc, which is rather quirky on a monochrome
sensor. I am thinking that white is more useful than black if you only
implement one.

  Dave

> +}
> +
>  /**
>   * ov9282_set_ctrl() - Set subdevice control
>   * @ctrl: pointer to v4l2_ctrl structure
> @@ -662,6 +697,11 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>         case V4L2_CID_FLASH_DURATION:
>                 ret = cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME_SPAN, ctrl->val, NULL);
>                 break;
> +
> +       case V4L2_CID_TEST_PATTERN:
> +               ret = ov9282_set_ctrl_test_pattern(ov9282, ctrl->val);
> +               break;
> +
>         default:
>                 dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
>                 ret = -EINVAL;
> @@ -1242,7 +1282,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>         u32 lpfr;
>         int ret;
>
> -       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> +       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
>         if (ret)
>                 return ret;
>
> @@ -1314,6 +1354,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>                                   V4L2_CID_FLASH_DURATION, 0, exposure_us, 1,
>                                   OV9282_STROBE_FRAME_SPAN_DEFAULT);
>
> +       v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov9282_ctrl_ops,
> +                                    V4L2_CID_TEST_PATTERN,
> +                                    ARRAY_SIZE(ov9282_test_pattern_menu) - 1,
> +                                    0, 0, ov9282_test_pattern_menu);
> +
>         ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
>         if (!ret) {
>                 /* Failure sets ctrl_hdlr->error, which we check afterwards anyway */
> --
> 2.43.0
>

