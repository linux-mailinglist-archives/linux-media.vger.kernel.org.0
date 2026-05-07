Return-Path: <linux-media+bounces-60806-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMxQKdOV/Gn3RQAAu9opvQ
	(envelope-from <linux-media+bounces-60806-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:38:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DFA4E95F3
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 131043026F33
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824F63F54D8;
	Thu,  7 May 2026 13:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljck0YhJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8413F9F27
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 13:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160940; cv=pass; b=S591yUJWClFcWn+rmw08AdN4RY7MTu0UJY9yColzcVTDncnxJyyeqf3CT61dSNv8nVsbu82DxBrbtTHSGZwJbHazbjFWv+bWoJDCn0nVsw7LyVaycElhnmuuxOGyJhneHKSuSkBXdW1UcWbp2GUe3oQXmDLRW/x1GL7PIaslQMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160940; c=relaxed/simple;
	bh=zFi37WOHMnD2fGFA1dmfFCncgxAuI+BdsH4IGYbGfXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CE8IQdtd+6IF2yDNNrkJSQ0hU9TKx3elsadzS/4hABAu2GmC3Zc1sEP5nF83VO+uUC5GTnB7c6MGnBCzl+ZktCn8uwbuJ3k8fXqf9ZzzBJcJF4BlfjhW/XhAgxm9do6HFx4tuUYck/TdL8MwODrcV1fXUX+G+RsKKCGxe3CZ+rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljck0YhJ; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12ddbe104ccso844364c88.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778160936; cv=none;
        d=google.com; s=arc-20240605;
        b=KgIcDhRiPO9Kss74wAA0dH7keJtFr6Q7Wt0uluYiUuAXL8cEOscfq+CyGpskDYXsvW
         nDp8OZjbe6cQ5GRS1RIwhbx9ILTsVJ+R01WxPMHF1LNOeKS6Cq/mGG1va0M0tudxMdzA
         fOjDNR3ADA2w8NZZj7b6uZcvsg4OKIqLNx3yrurAxr088ri6xqYgDoW2ZwZjL0wlO0VG
         Ed372FCORXsgCZjj9Sp12ege/E+99TDcyvrSmS/C3VR1/yHpir3CtMUpKuRy/Ago/3Z/
         OU6oTIZxJ1aLOFjsxuaB8KTUtLxJ9H+ABETTotkGlVGLK7k1nqJu352MeEoSPRYtEnl5
         wVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yIW74LfJcqNSSJkFrqdk8Y22u7WmxHTRMdFEB1r680I=;
        fh=bYv+NfbmzQlR8G9Uqieqkz89JZ13hbqixLpsx0iLL54=;
        b=FvzQgeulvm4PvU42lr1nRlQjJ1g5T9gjJE1W9qcUzAtNPlmJLBEuobRTi4bb+rNCIR
         vtvDZ/GIO5V+KL9HkIXUPf9z/U6jkbVk5t0MGs593MxHhcUYRm7XyTVxcZmZ5IHLw6B6
         KCrv86QaAAiSqQ55Yc/9W6lqvI3D8Ax0bTUjAYzSdpDK32DBFGLIEFk0IvnAl83IR2bK
         jzhs9PnJMK8Lu4I5FVgcvyE9OjNWKYspk8C/sICMQTGjS/5MGZPkBXydJFuYzaCjxf9Y
         XLo67JRBelxA+XcjOaT7uzOmyYetc0t51PitGX2eT0JGF1lyLYgMRTedqqCmvsaHbLOs
         We8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778160936; x=1778765736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIW74LfJcqNSSJkFrqdk8Y22u7WmxHTRMdFEB1r680I=;
        b=ljck0YhJ6PgNTKHHNhYGp8ZVBVhPRKrxuKWDtBXq6xr0GiiSUwrGBZOCnjpPfB9CZR
         sJhWW44QBzzenUEL7wpy5pjkUw9q3zzGg2E14hxx0TTZ7pUbhZJzhXUm6C2Nm+XHLuEN
         iAuZ1TGZxgLk5NiifXh5dyixCqnKMAxJ6U4IQgCRvClCj+m3K0EXyajfAqapcUgPWGIm
         TRg7OGjKBynBrMKsMnWswakxtkJRqWCysvZ7UkWBjMJCgEoWP6ASucD3dep6w10Rr7ld
         4tsA1kyfaBpDKhyqDKpYP3ExZANIFyqgV44BR8p7saBo+eTE7Ir5e0bulzq9Ky3X6Cgl
         8QwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778160936; x=1778765736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yIW74LfJcqNSSJkFrqdk8Y22u7WmxHTRMdFEB1r680I=;
        b=T1E83r4Gnb6oU1CwBNp21Ir6MqL4Tzr0x1ad0o1GH+ASjqlC/WvnpPa3+7mHvQoa/2
         KNRDCa8+Jp5vIka+lCVh/EvInjWqezuQorKFAiJ7ZNyeRnRisdY7VPFHuu9c4KG19dz7
         yY+GoeABvtThvODdX3ElnD8kXQ2/e9hiIJDeLKBz/flmecyafzJ3NZTX0gLNUZNkmO1T
         BdqGDMw9v5hrdKRmqGwgZduk5YXpfOzu1iAiZO3VF/pFGgF34D9tkbFVc3KwIZUuC/KY
         OfQP4ZkuM8SXrdD2bIxLJ269aDLB24oeWutbDHg04sNKOwFw6LN73zx4nF6qVmpEa54G
         4Mig==
X-Gm-Message-State: AOJu0YxgDHJ2kH+79wvE9Eq8ZKyar4cW/gfmZudMt9eRq9tBVMN6PZOv
	Lzm7t6pYl1Wkni181yR2QKB7E/qrBKVazJRkJqnspZaycIbrxMvuxnRET9oIk0NVNaYKF0Fp53B
	Z+7FDBKBEo28mZ9kht5iVcRBoapevl8s=
X-Gm-Gg: AeBDietH/JSUZPhJ3NXIptl5rS5viR/wYHbkPVkl0cK6DMDYlICiTSLCmkVXHs6JioK
	GfYlRdIose5ilSfV0w5fsrpeLZnvned+0dHTe0Yb8KjByofPjyG8azKhLzvli1q0t2wBu/OZYCe
	mrAmLHLoTQmVKQVCo63QID1SlUsaKRAZmlp3/l8bz6H+FDr8xTndTXdpIycw56CSCMoZgUUUC39
	8gInfYq6WrjUoPl7g+aFs1BrmjFJg3sgeGeh6QFDDUGkzl+nGE6cdHV/9MKOQCj2wpMHdSSXYs9
	HIQdi2sHdJ9bkgZF2BhRk4cUxDbFHA==
X-Received: by 2002:a05:7023:b07:b0:12d:de3f:d84a with SMTP id
 a92af1059eb24-1318eb41b81mr3610865c88.35.1778160935629; Thu, 07 May 2026
 06:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
 <20260306103614.3208182-3-eagle.alexander923@gmail.com> <20260505161135.GD1547435@killaraus.ideasonboard.com>
In-Reply-To: <20260505161135.GD1547435@killaraus.ideasonboard.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Thu, 7 May 2026 16:35:23 +0300
X-Gm-Features: AVHnY4JSoQPxSG1_-AH3TDVcV5vCvXQD6fKsE-bVCV2z1QwTxgZHx1yruhmxMl4
Message-ID: <CAP1tNvQtDSCtJ8UmmtdMK=Prbbs=s490WU=H=3_O5tJbmO6mqA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] media: i2c: Add onsemi AR0234 image sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Dongcheng Yan <dongcheng.yan@intel.com>, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 02DFA4E95F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60806-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,raspberrypi.com,intel.com,kernel.org,linux.intel.com,oss.qualcomm.com,linaro.org,foss.st.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,gitlab.com:url]
X-Rspamd-Action: no action

Hello Laurent.

> On Fri, Mar 06, 2026 at 01:36:14PM +0300, Alexander Shiyan wrote:
> > Add driver for the onsemi AR0234 CMOS image sensor.
...
> > +enum ar0234_link_freq_index {
> > +     AR0234_LINK_FREQ_IDX_BPP_8,
> > +     AR0234_LINK_FREQ_IDX_BPP_10,
> > +     AR0234_LINK_FREQ_IDX_MAX
> > +};
> > +
> > +struct ar0234_mode {
> > +     u8 bpp_in;
> > +     u8 bpp_out;
> > +     u8 dpcm;
> > +     u8 mipi_dt;
> > +     int link_freq_index;
>
> I think you can drop this. The driver already uses the CCS PLL
> calculator, so it should be able to deal with user-selectable link
> frequencies.
>
> This would require testing all frequencies specified in DT at probe time
> to map them to bus formats, and restricting the formats accepted by the
> driver based on the current link frequency. The CCS driver implements
> such logic, and there's also an implementation in the ar0830 driver I'm
> working on (see [1]). Note to myself (and to Sakari too): this is a good
> candidate for a helper.
>
> [1] https://gitlab.com/ideasonboard/nxp/linux/-/blob/v7.0/dev/rpi-cam/ar0=
830/drivers/media/i2c/ar0830.c?ref_type=3Dheads

I reworked the driver to iterate over all link frequencies from the device =
tree
and validate them against each mode using the CCS PLL calculator, as you
suggested and as implemented in the ar0830 driver. The PLL calculations
themselves succeed for both the 360=E2=80=AFMHz and 450=E2=80=AFMHz frequen=
cies with
both the 8=E2=80=91bpp and 10=E2=80=91bpp modes - the resulting bitmask was=
 valid for
all combinations.

Unfortunately, real=E2=80=91hardware testing showed that the 8=E2=80=91bpp =
mode does not
produce a correct image (MIPI errors) at 450=E2=80=AFMHz, and the 10=E2=80=
=91bpp mode
fails similarly at 360=E2=80=AFMHz. The issue appears to be that the sensor=
 requires
different MIPI timing configurations (frame/line preambles, D=E2=80=91PHY t=
imings, etc.)
for different lane rates, which are not yet implemented.
Since the PLL calculation alone is not sufficient to guarantee a
working pipeline,
the automatic selection of any frequency for any mode leads to
unstable operation.

For the time being I plan to revert the link frequency handling to the earl=
ier
approach where the device tree provides two specific frequencies and the
driver maps them directly to the respective modes.
The DT binding will remain unchanged, so when proper MIPI timing configurat=
ion
is added later we will be able to adopt the fully dynamic model without bre=
aking
existing device trees.

Thanks!

