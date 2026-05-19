Return-Path: <linux-media+bounces-62176-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MpyCYKaDGqUjwUAu9opvQ
	(envelope-from <linux-media+bounces-62176-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 19:14:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 236E6582E39
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 19:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A02C6300699C
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 17:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7B13FC5C8;
	Tue, 19 May 2026 17:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfQ1jcYJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F10148AE17
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 17:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210870; cv=pass; b=eUxUpynp1sOxP9rOyYivNX0BqBMbvwwePP/AW6QvMQlFuHd/De+7/LinhDlhizn08hOOX+1gUCdkroW9d43XfGZpUagNRFYlcU4/MSPVM2RuPa36J4LAkxbCTGIr/2yRMIctmF+Q30pVYtRthVYBb7MdypwbYS04Vzp9O1iqY9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210870; c=relaxed/simple;
	bh=d00V6h/ErpHZASrHHwfgf+2hWEHhE33Q48KoY0RIrXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUTamfdt7JG4FcE2gb55Jyaemm8gqvhTABbnGzXyeghK2I+W5Vf6mRnr7uxoGmqA3HWrf58YcMJVg47K6OmDfID9XG+oTVTLLj8l257ulEuB3GZ6frYNmhyADfPOFyFxHpu0Vyw8790whI7sz/pVR7bpoQ2AVjM/8biP+zsp7Rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfQ1jcYJ; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c1a170a50so4771096c88.0
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 10:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779210866; cv=none;
        d=google.com; s=arc-20240605;
        b=VoBMRmDXZAHQv3mP3WmSyXP8+KMmXQaAj7ydVQSP8clARG4+FAkz0nD65T9tLLqZwJ
         x6G+rWGZjqMOJeRiZLDyqojjFUoktjardeIfKcIQpleHgSYVnXHT8spnFqSbYak4wq4s
         6a9UJt2phDlgKwZpO6YSD7QC+v14QdbDovrcqx7j92wRRpsORU4tLKdVIXDFX/0X5oa2
         PeSc1UMilKQ7ROOZX15OptJIlvAEbhh4ja/BB1FlYn1rEcSk4jAMfQD+2hpO35ywwDBJ
         D2/VkGgS5zA9iRf8rR3G+4vQET3UaqRbbtoqHJQNMYlDA0a7G8249WdivTRzX5+DIHpJ
         6KEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vF3PbAIpdXzsjA1Yq+yZ7l3npr4+DUB3TFT1IALczSw=;
        fh=EDRSltopB4CaUoMRW29lX6bBVjFQlCamLgOITIkPrs4=;
        b=VPEIK0T3GecOO9TUJEhlrpuptDsNTCywS3FTtHAArsYHXH939Q+CQrBKtLLfriuuNV
         ObqWRLXojzFTCQCLA2tNbUzW3fpi6VtRPMCvCXB4I0tQPssQe+Y4xZu1j1SuGaFaDZ0G
         bhb3t6DMpFyHRuAigszbBbkqmohODX+FW04vJwrmmBfNXChI/kJQnbSw7UmKn1UUpO8f
         ejd3bf+eETASJqJp2tekNNAfvaGnod6JhpNd8VfR44u0mGKZaE4WhIk9yQzzI2BjrQ0D
         lkyFy3XiVE2ESeX5P92nP8m3hfUkAKSYjgPc3ohcbEUCRVEngPcyrgv66m3sQTKFuJde
         ma1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779210866; x=1779815666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vF3PbAIpdXzsjA1Yq+yZ7l3npr4+DUB3TFT1IALczSw=;
        b=XfQ1jcYJvFBSHhD5+523iNJvDUk43DYp1gmfTPkGMtNpZX1oDCXZYjsKvtkvATHgcS
         Gq+2GsXnJjV8EV8e01Grs8L/SKM0U+Cl5MPjbW7i1boBpCF2WARRityhb+VI1rtscUeT
         SeXptP+CLvigUixbDt+TElZZlgezjtPJXyqwm8r/EfyLY20xQ0P9XXKeBZ74MxC/WIl3
         Bzo03mpoQos2fePDfqgVOs35Z5SVxOucwFVj8Sqth4PKHbFZmrKcVAKQsuurcfdSywJw
         xRxsn72jPPpGNhU6FRyx0BSVGZqtICz2/ir4kyeqAlCOQWJl+ZB6/wU1qdb4HEN9macd
         KFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210866; x=1779815666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vF3PbAIpdXzsjA1Yq+yZ7l3npr4+DUB3TFT1IALczSw=;
        b=PQdPv4qC877Hi7uTQrmxGb0U97XrOQpHrD+0lqOjYg6Sy3JN+K7jrpK7QmrzLtdQUE
         2r+Z/KLncd4KGopMcZJRYn2fB9c1hC4SxvtXXZRMN+qwXemJWkjuw8C9ejPn1eRLGyjo
         2EG+k0CGxgBiBB4CSRsH9kotD15TJEwlVprhEPFJRQejxKDUHzgYSL2hFau5nXM2gTGz
         mMOzzPp8w6T5E4goHvDUvJ6FqIPXevF6Kmb2g3vhBLxpaMeNqT8DqcQPM/yhCDCw7Wxh
         qISfSiTOWGigWUF4+pGIPh85Vs0NROpsphCyNCtzoJ8od/YFZVyrGRmJTmKoAm4Nz2Xe
         VuQA==
X-Gm-Message-State: AOJu0Yzqh1sS/99Mh1KBgkvU73WVGRdC4hA0sD47Py3tSu9uMxgQzMTo
	KtJ1AFoMRmbHuKTi+oYkHsy65pTs9Uc6QS+aXhrSG+BqywykehTIhILEGtVGXWqcvj+l07CQ9MP
	tjmdbakwRWGokyypV394/MwSQ1eOMgfQ=
X-Gm-Gg: Acq92OFK7VtSE8cT+/3Tw+hl9Da/Cg060kMLukN233iWdxsNRRLw1gITLzoNKJuxseg
	sr7VsJvxhWQN7cTwqY5o7v4MaTUzuRbOVRmpYYZXtW2AWZdywcrxCPRPpspiNddUKQconZhVqXm
	eidhrdwrEiT7nSmvwmgqUU9kKylmn4ZycnhHpZ0vWTVD58jTyxdwjVY5ZOBcdJTqW/a2oJhAVQ9
	Q36qWzvIABxFw+YmnLI76mvPaPpG0I5mHy6CGwfEKy8RLqsDdAcRS+H2Ln5Xr2Pubu6MLyDgPb8
	kYK7nw==
X-Received: by 2002:a05:7022:251f:b0:133:1d3d:f93e with SMTP id
 a92af1059eb24-13504a4f6bfmr9059140c88.42.1779210865614; Tue, 19 May 2026
 10:14:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510235037.24876-1-hoff.benjamin.k@gmail.com> <dd77b328-f792-48ac-a427-fc70c0e2c987@kernel.org>
In-Reply-To: <dd77b328-f792-48ac-a427-fc70c0e2c987@kernel.org>
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Tue, 19 May 2026 13:14:14 -0400
X-Gm-Features: AVHnY4JxgJcf2FS8AKM2DSPQHpsgUjSCC88b9dTquYzMqHGyFLXfPBt7NbuHxy0
Message-ID: <CAMSzxxTgmAaLPKosRGi_88vm+psHHaFLjcCkOc2PdTK05gBebg@mail.gmail.com>
Subject: Re: [PATCH v7] media: pci: add AVMatrix HWS capture driver
To: hverkuil+cisco@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mchehab@kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62176-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linuxtv.org:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 236E6582E39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

Good catch.

I've created a new patch here that dropped these three functions, see
it here: https://patchwork.linuxtv.org/project/linux-media/patch/2026051916=
1218.79385-1-hoff.benjamin.k@gmail.com/

On Tue, May 19, 2026 at 9:00=E2=80=AFAM <hverkuil+cisco@kernel.org> wrote:
>
> Hi Ben,
>
> On 11/05/2026 01:50, Ben Hoff wrote:
>
> <snip>
>
> While looking for something else, I stumbled on this:
>
> > diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.h b/drivers/media/pci=
/hws/hws_v4l2_ioctl.h
> > new file mode 100644
> > index 000000000000..53044f78d6fa
> > --- /dev/null
> > +++ b/drivers/media/pci/hws/hws_v4l2_ioctl.h
> > @@ -0,0 +1,36 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef HWS_V4L2_IOCTL_H
> > +#define HWS_V4L2_IOCTL_H
> > +
> > +#include <media/v4l2-ctrls.h>
> > +#include <linux/fs.h>
> > +
> > +extern const struct v4l2_ctrl_ops hws_ctrl_ops;
> > +
> > +int hws_vidioc_querycap(struct file *file, void *priv, struct v4l2_cap=
ability *cap);
> > +int hws_vidioc_enum_fmt_vid_cap(struct file *file, void *priv_fh, stru=
ct v4l2_fmtdesc *f);
> > +int hws_vidioc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_=
format *fmt);
> > +int hws_vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l=
2_format *f);
> > +int hws_vidioc_g_std(struct file *file, void *priv, v4l2_std_id *tvnor=
ms);
> > +int hws_vidioc_s_std(struct file *file, void *priv, v4l2_std_id tvnorm=
s);
> > +int hws_vidioc_g_parm(struct file *file, void *fh, struct v4l2_streamp=
arm *setfps);
> > +int hws_vidioc_enum_input(struct file *file, void *priv, struct v4l2_i=
nput *i);
> > +int hws_vidioc_g_input(struct file *file, void *priv, unsigned int *i)=
;
> > +int hws_vidioc_s_input(struct file *file, void *priv, unsigned int i);
> > +int hws_vidioc_g_ctrl(struct file *file, void *fh, struct v4l2_control=
 *a);
> > +int hws_vidioc_s_ctrl(struct file *file, void *fh, struct v4l2_control=
 *a);
>
> These two functions are unused.
>
> > +int hws_vidioc_dv_timings_cap(struct file *file, void *fh,
> > +                           struct v4l2_dv_timings_cap *cap);
> > +int hws_vidioc_s_dv_timings(struct file *file, void *fh,
> > +                         struct v4l2_dv_timings *timings);
> > +
> > +int hws_vidioc_queryctrl(struct file *file, void *fh, struct v4l2_quer=
yctrl *a);
>
> Ditto for this one.
>
> > +int hws_vidioc_g_dv_timings(struct file *file, void *fh,
> > +                         struct v4l2_dv_timings *timings);
> > +int hws_vidioc_enum_dv_timings(struct file *file, void *fh,
> > +                            struct v4l2_enum_dv_timings *edv);
> > +int hws_vidioc_query_dv_timings(struct file *file, void *fh,
> > +                             struct v4l2_dv_timings *timings);
> > +int hws_vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l=
2_format *f);
> > +
> > +#endif
>
> Can you make a follow-up patch to drop these?
>
> Regards,
>
>         Hans

