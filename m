Return-Path: <linux-media+bounces-64328-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wTWnMPpaKGqXCgMAu9opvQ
	(envelope-from <linux-media+bounces-64328-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 20:27:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E596634F4
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 20:27:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=bc1dozE9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64328-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64328-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C64D31143FA
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 18:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611774C042C;
	Tue,  9 Jun 2026 18:21:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00294D90CB
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 18:21:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781029293; cv=pass; b=meSlS+BsraGPrtWSP1TMWOPu6yBGErqTemjIsnuVj81wISxyVwhiP+Jjn6xVoMmrgmAHLpqUNNPY8LugQDCIznY2qfO+wjtnLMGzueTwjBFYKANxPV2yhSMz0AhdkY8BNP8Bg3fIYXbD8qvtf+WB9FxCk27nXi9O/FmflDTE87s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781029293; c=relaxed/simple;
	bh=iIpRUa5YtQo/UV0SqGNaWoxYlHIksyKh6NL/tR2524o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BnXbKTf9M0jDGQ+7W8tTHtbNcaVqNNkF89PnlDLFCgjFVQAfJSkadQfzZ+issZ9snnNfsKqbej8VKtygQNjrVBGO4BAmyinocHY1fMcIwy49ct/NzTmok2K/sJY7Yi7WCB17p4ueRnAbpalb1u1oYEEz3+aC0fNIlAklKHBEUYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=bc1dozE9; arc=pass smtp.client-ip=209.85.208.173
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3967725a77fso58289511fa.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 11:21:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781029289; cv=none;
        d=google.com; s=arc-20240605;
        b=eSxopmXi2Vfk9YdSK1yIx+NUaFuB4jFgobLHH6GBBwleM7ltFlRNysyeyrEbYWfSBE
         JtJ+ijrp2s108BDYca7uMYxrBrXo0x5QE9cXrn1S/3ZVFAFvFtDhPxc54q2uj8RW+8BK
         AR8jhAJ2cPkbRk7US2aHLePEg2Px7G9TsRQlh7kEvnoefnawb9cC7sOD1gns2pAWr3Iz
         A/PsxYlqTyoQDPdJPj4woG1yYm/Ovd48p6KaQMf+gh+HjdIe2n5wxhEAudsDHxn1sesv
         4sYce0Ia8J071gFVILrVRjZHbxwEZ4eBejSD1t8Zc9mC2eSk5wrWXl731mcofcrfSodE
         oKvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rbFWOTWXajHRnIT6aKfpJMqhDixlHauFDQ7YVSq/BUk=;
        fh=ddy4dXPhJEbhNrP8svLzWaV/jR58mcepvjhBFXz6NLM=;
        b=k+kheBzldnFMbscu9CAf1xaENvMxxzMMhog+qIzXh/ZHQNVonOnxF/7hEnltYUuhpR
         fY39gONCc/kJinMejh1l4jap6LcKc4auV5SeU8sSgSNAvGaJexWidUCGuMBMKfUdFvVH
         YNTCL17iPgxHIEhnfQBOl2djSLO2VTfQv4ulrWPOU59GfQNcrQ9rvz7pgedbI1803PEn
         sPyW01KoYe2bRMXOy+oraxzriJH/wu+bcEK9n1gotma+KgekMWXeMdFxg1j2FMRvFs7G
         oNW8RZve2JmWohRdMXHD3FCVeQCJsLA3Ov6Ad2ETAhFx9TgxlxSkXf4jWnX8m49sq7RU
         IeSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1781029289; x=1781634089; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rbFWOTWXajHRnIT6aKfpJMqhDixlHauFDQ7YVSq/BUk=;
        b=bc1dozE98PRJIdJF4uKG1YRUsugdGDxe1xND39I8hd6/Cbg5s4x6R3vIv1YzCCjBcy
         Xu4HQdsjA76kOcdulTeqx/dyUQMFHPtXJK8LIZVL8akjn7wB2NapNuCu98flCqzYApx/
         3pFTAI3t3Ac5Jo7dK2pYsO9Q8oic6mg5Jd0u+DnHUHK+i5/7ReMNpHJreTNQo37Uz1eF
         DhscxEanq41GcS1dHR8dfWyowaUFbjmvRztQMaTsr3G0WV03XLSJ2TkqS1xbLkH2LyKS
         tLIPudXMxnEzwE2/5GdzpsYpGLLr6Utnwfo2I7NNGt0f96xVOCsP7WrEhYbPLP6QIBe6
         5u4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781029289; x=1781634089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbFWOTWXajHRnIT6aKfpJMqhDixlHauFDQ7YVSq/BUk=;
        b=HLqux9ShlWSmPX902MrWsVRj7hViM8NqWPxXx3+oMsbtdrrd3aeny+nZaS2VMlozFq
         vhd3w/KkmcAMO4S/UWqXmLKnKeA2mrI/19DOOITXXPLPPhTUX3EuCvWjymjFCBKEBVQ0
         qvrEzANsdLZBBCbaE/3HvGtgJ1HzkRXw8PRzdoIRABcD9HFpzBCZoTzSbXvDvklmfg4X
         MKlr0RHFV3SIG6r2pP+pavAQdyVsPgAuhyw9tqWznCDO8WM4JxG51bNQu6WBwpC797Gv
         orIB0GHTu3U37pQzgWhKz98pReHPdnXp+xamfcsa2ZnwOgSkglOPqrcOAcsFP2G4DcZk
         v4Ig==
X-Forwarded-Encrypted: i=1; AFNElJ+LkwrKi1YgAcO017nsoR2RzmP3OJSfTnBpx2oKUMvXUPlNX6jo5iQ9TyHdQvGRVP6Kid7JEKPQfNRtlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79NpfoG2uUDllM921zQfkrPNiKJgdtJWQ+PNDstSotJLc7yGw
	prj6K0cTEEEHBo1NVpyHPxMZCHNvlmRaoNKYPQk9MI6ZIpnjX3iPweNTGkXOO0Tw0C1EoS6yOiU
	jzbh9T7jVNJgwqHV+vkY5HHW1Am0Cj/vR3ngGv8CyWw==
X-Gm-Gg: Acq92OEsLLpYuT5flYnIX24bP+1wsdZqLDIzE1Fa3D7sAAc160BwLrVLAz4IlYR2Je2
	2lBAbygS9wU5TPjgwQ1wXLy7cB6Dh6Af7OEphBxmeHfcZmXoCaZMCSQMFXpOJ/uP29/+OgmJKCG
	2Ty9P3ACmVT6OtcJTuRK/wrOaUIzWcJYm7p9Qdd4zEMowN1wwzGJ1HKQv8r2KPNRKpWke/MV2XV
	fnxVnuF49SPKayo3BC6H5uXJ0maN9UZ1afhwibUkeThE8pkRMZn4lAqGy3uyqnCrME6gYkLvtXR
	X/4leLszfw/yWkYyNBmabs+iXNskA52tiFnn1Z9c3zDlFQEOfIp7JMGyHsLjio4eTpupQc7EXG4
	dW0QDYDQSSEXL/Z0OXbUlvGsrPkd+u4xFWaZN82611K+wXg==
X-Received: by 2002:a2e:bd0d:0:b0:394:1192:5e1f with SMTP id
 38308e7fff4ca-397f7843a18mr10610731fa.22.1781029288818; Tue, 09 Jun 2026
 11:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-imx219-pixelrate-v1-1-02359def6b41@ideasonboard.com>
In-Reply-To: <20260609-imx219-pixelrate-v1-1-02359def6b41@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 9 Jun 2026 19:21:09 +0100
X-Gm-Features: AVVi8CeUXxw2EamOsLP0hg6vrBt8Govn7sxiZJk89Teq_2r1bAIJUbddt6lu_8U
Message-ID: <CAPY8ntCcUgtmLxopBJncXJDXW-wp8Dupg0GdbDZhAv9Pe7S-tg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx219: Drop the hack of doubling PIXEL_RATE
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64328-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:email,raspberrypi.com:dkim,raspberrypi.com:email,raspberrypi.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4E596634F4

Hi Jai

Thanks for the patch

On Tue, 9 Jun 2026 at 08:03, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Doubling the PIXEL_RATE for the special analogue binning mode was always
> a hack done to make the userspace framerate calculations happy, as the
> sensor's PLL has always been unchanged.
>
> After analyzing the sensor behaviour with minimum possible values for
> frame and line length for different binning modes, it is likely that the
> sensor is doing averaging in the analogue domain for 4 pixels when the
> special binning mode is used. So use that to model the userspace
> blanking controls, instead of the hack of doubling the pixel rate.

"Averaging 4 pixels" doesn't actually explain what is being done in
order to make a model, and is very much educated guesswork as to what
is going on.

I'd suggest something like:
When using the special analog binning mode the sensor requires that
the Frame Length is programmed in units of 2lines, but it is still
producing the same number of lines overall.
The new raw sensor model requires that the pixel rate is fixed, so the
approach of doubling the pixel rate when binning can't be adopted.

There is sufficient range available in the Line Length register to
halve the value computed and passed to userspace as V4L2_CID_HBLANK
instead, and thereby keep the same pixel rate.

> This has an additional benefit to make it easier to move to the new raw
> sensor model, where we have to expose the sensor's frame length and line
> length registers directly to the userspace through new controls, thus
> requiring the pixel rate control to match the sensor read out.
>
> Whether those new controls should also scale to give userspace a
> "correct" view of the sensor internals, as opposed to the sensor's
> register programming model is left as a decision for later.
>
> Link: https://lore.kernel.org/all/178091757893.16054.4583389270412251379@freya/
> Link: https://lore.kernel.org/all/20260409201501.975242-65-sakari.ailus@linux.intel.com/
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
> This is a follow-up to the discussion done on Sakari's proposed fix for
> the same issue:
> https://lore.kernel.org/all/178091466607.16054.13972332068848565738@freya/
>
> Tested on Raspberry Pi 5 with libcamera, which can still hit the same
> FPS ranges as before for both binned/non-binned modes.
> ---
>  drivers/media/i2c/imx219.c | 65 ++++++++++++++++++++++++++++++++++------------
>  1 file changed, 49 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 7da02ce5da15..534d9ba0588c 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -420,7 +420,33 @@ static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
>
>  }
>
> -static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)
> +/*
> + * When doing the special binning the sensor does the averaging in the analogue
> + * domain (before ADC) for both H/V dimensions and reads out only a quarter of
> + * the pixels.

This is phrased as a statement of fact when we don't know what it's
actually doing.

> The sensor programming model convolutes this by never changing
> + * the line length values and expecting frame length to be in units of 2xLines.
> + *
> + * FLL = (output height + vblank) / 2
> + *
> + * If we go ahead with it and set `vblank = FLL - height` it would make the
> + * control value negative.
> + *
> + * So we instead keep the userspace sane by adjusting the blanking controls to
> + * match the sensor read-out instead of the broken register model.
> + *
> + * Thus compensate LLP in the other direction,
> + *
> + * LLP = (output width + hblank) * 2
> + *
> + * So the blanking values are:
> + *
> + * vblank = FLL * 2 - height
> + * hblank = LLP / 2 - width
> + *
> + * where FLL and LLP are the values in the registers using the sensor
> + * programming model.
> + */
> +static inline u32 imx219_get_fll_factor(struct v4l2_subdev_state *state)
>  {
>         u8 bin_h, bin_v;
>
> @@ -440,12 +466,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
>         const struct v4l2_mbus_framefmt *format;
>         struct v4l2_subdev_state *state;
> -       u32 rate_factor;
> +       u32 fll_factor;
>         int ret = 0;
>
>         state = v4l2_subdev_get_locked_active_state(&imx219->sd);
>         format = v4l2_subdev_state_get_format(state, 0);
> -       rate_factor = imx219_get_rate_factor(state);
> +       fll_factor = imx219_get_fll_factor(state);
>
>         if (ctrl->id == V4L2_CID_VBLANK) {
>                 int exposure_max, exposure_def;
> @@ -478,7 +504,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>         case V4L2_CID_EXPOSURE:
>                 cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> -                         ctrl->val / rate_factor, &ret);
> +                         ctrl->val / fll_factor, &ret);
>                 break;
>         case V4L2_CID_DIGITAL_GAIN:
>                 cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> @@ -495,11 +521,11 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>         case V4L2_CID_VBLANK:
>                 cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
> -                         (format->height + ctrl->val) / rate_factor, &ret);
> +                         (format->height + ctrl->val) / fll_factor, &ret);
>                 break;
>         case V4L2_CID_HBLANK:
>                 cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
> -                         format->width + ctrl->val, &ret);
> +                         (format->width + ctrl->val) * fll_factor, &ret);
>                 break;
>         case V4L2_CID_TEST_PATTERN_RED:
>                 cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
> @@ -884,6 +910,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                 int exposure_def;
>                 int hblank, llp_min;
>                 int pixel_rate;
> +               int fll_factor;
>
>                 /* Update limits and set FPS to default */
>                 ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,

If being a real stickler, then vblank will have a step size of 2 when
binning, aka fll_factor.

> @@ -910,20 +937,28 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                         return ret;
>
>                 /*
> -                * With analog binning the default minimum line length of 3448
> -                * can cause artefacts with RAW10 formats, because the ADC
> -                * operates on two lines together. So we switch to a higher
> -                * minimum of 3560.
> +                * With special analog binning the default minimum line length
> +                * of 3448 can cause artefacts with RAW10 formats because the
> +                * sensor is averaging 4 pixels in analogue domain as opposed
> +                * to just 2, increasing the minimum time to read it out.
> +                *
> +                * So we switch to a higher minimum of 3560.
>                  */
>                 imx219_get_binning(state, &bin_h, &bin_v);
>                 llp_min = (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ?
>                                   IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
> +
> +               fll_factor = imx219_get_fll_factor(state);
>                 ret = __v4l2_ctrl_modify_range(imx219->hblank,
> -                                              llp_min - mode->width,
> -                                              IMX219_LLP_MAX - mode->width, 1,
> -                                              llp_min - mode->width);
> +                                              (llp_min / fll_factor) -
> +                                              mode->width,
> +                                              (IMX219_LLP_MAX / fll_factor) -
> +                                              mode->width, 1,
> +                                              (llp_min / fll_factor) -
> +                                              mode->width);
>                 if (ret)
>                         return ret;
> +
>                 /*
>                  * Retain PPL setting from previous mode so that the
>                  * line time does not change on a mode change.
> @@ -936,9 +971,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                 if (ret)
>                         return ret;
>
> -               /* Scale the pixel rate based on the mode specific factor */
> -               pixel_rate = imx219_get_pixel_rate(imx219) *
> -                            imx219_get_rate_factor(state);
> +               pixel_rate = imx219_get_pixel_rate(imx219);
>                 ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
>                                                pixel_rate, 1, pixel_rate);

pixel_rate now never changes, so there's no need to update it here.

Overall I think I prefer the approach to that of negative blanking
values, and it's pretty much the comments explaining it that are
slightly awkwardly worded.

Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

I do want to just confirm that the slowest frame rate hasn't been
altered, but I don't think it has.

  Dave

>                 if (ret)
>
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260609-imx219-pixelrate-d6cc96558482
>
> Best regards,
> --
> Jai Luthra <jai.luthra@ideasonboard.com>
>

