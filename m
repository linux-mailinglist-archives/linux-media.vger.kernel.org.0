Return-Path: <linux-media+bounces-56928-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iF+eKfoYw2kUoQQAu9opvQ
	(envelope-from <linux-media+bounces-56928-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 00:06:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0944831D9E4
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 00:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53EF83027951
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 23:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AD13B2FD2;
	Tue, 24 Mar 2026 23:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aHKiNYtt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F006E3002CF
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 23:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774393581; cv=none; b=cP7nyAx75MpLOgyqdyhUcMc+pNQ/yhozs26eZrYCiwTHaj1e6DoTDUoGigfolwBVClLSjQZbkJvEBFNwiBb87+fBs5cWmOchL5DIgfc/GrkU6HRmOFZ8xvQtoIh+J6pX7dtJsjl7LjHN+u6y2RvUeKjLVjNYV2A/OJO8Zjx6gpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774393581; c=relaxed/simple;
	bh=UDfg7P5qFgiFa631P5BB+8/mGBQ0FIHmRMtbj0pDDys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AVBdrDhOOwOztaWsz3omyak+j7Xyqz/omOpn14DDj/ejoxP+FWuVqMJLyXrjh8rPd9qgKk4i4yG8k3YR38sWE+3+NEcD83YqEEwTkNVsvgaGlAXnbR4JmmUZpSxS9I/g7Q7bJSFUjXOOfO6qPdqdsYxbwlk6ioyaufiPzZYg9mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aHKiNYtt; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82a07738118so2434846b3a.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 16:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774393579; x=1774998379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDfg7P5qFgiFa631P5BB+8/mGBQ0FIHmRMtbj0pDDys=;
        b=aHKiNYttMfaC9Nqy39q7A3yG3gEQfThPqxwEgpyoqJ7P7FEJ7wG6FvaGk6h9xswhq4
         /tJ7uIxfxoxubCYSZYsMBqyykyDsUpDuSBN2OsLiw5j9MAsHYNmEfH4PXqq/vfAbWWgE
         uSuAq8wdXfwC20v6FX8BLyse0VLrtZEiOn5Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774393579; x=1774998379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UDfg7P5qFgiFa631P5BB+8/mGBQ0FIHmRMtbj0pDDys=;
        b=Ilg7OpaslwaGyF4JFmP4CSgGuQ31vyqIe2zDnD82lUo/q7l9MasHPx6hMADY/10IrV
         zlAPhn+/vckMNCzpxrZV6cgWqAkCRlBUePS2LfSDvvW2p3dKP8tkKgEpGYhp8WpDl4yJ
         E59ya0wTaNtKc2mmwfdhYxTjPpg8Z6XiAMCQ/8diAzvCiQC4TJ4+iEk9fmkMoG29L+W6
         ML0z71F52BGg75yx9X/9vPSGQUi7JfOhNWaaNWCHn2TTn+HcSSG2rvU/PMFip2ipsMRv
         uuaJPJx4Kz8G58hFWfaT4Ahdr7kGttDuO6YamFrXdAXs0dBQP0dUGcnQnvRxJkYQI34D
         xdjw==
X-Gm-Message-State: AOJu0YwOTzxCo3cgST5KTQEgx4DzOmqCKFnGRDoBvF6HCvtaRWpzwRzO
	smtrbNTpNG437eIAzwewaWwRnVJGKBNJ35xu+qqlqLL+PEsHckkbsO8TgHHtvlEwGgb6ZDUxr/v
	XzPs=
X-Gm-Gg: ATEYQzw414lkR37YwtqxO9WqYa/Q/mSRuJJOCURtE5sqvIWjNrzUFOy8DS0zSkP8efi
	Usx8b+vPhX4TyaMfhBI+UX9841oMvsItON/Eg7yY1QRsUjtKqOn2hEQVNqIEMWRxm2MR4UlgUCF
	rgn2qNNDj0w5DIZYQO0YXwjHBCw/msVJHWL5ci/UyRRKTU4P6z/dqB8W92WN/ZYkh6G5iMuFCgJ
	SEnTL7FCnFSGJTWjGy+1lvq3Zrj8XlQC/EhP+slemmfUNuami8y7/un5pxWqPQPvPVr4upfVBeu
	Jn75pHWJKatOPt9ZINsRzZH0YRGdnTOKHCcyJHiADtXaLf+4newX/G479IKGVJyFZb2H3UH/VCS
	mC6JDdBpBEVNZC03dVVK5EF4knE2bmpKqW9O5Gj5ol74Kp6V/MazH0hv6bnxOzgpuLPJmLy8GHO
	dCC31r3RhFMLz0OjnjVloKY+Q/fQz6E0+Occb5YY5JmHr2PSMu5vk7UGyyyR4S
X-Received: by 2002:a05:6a00:1d8e:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-82c6df27b5fmr1079476b3a.22.1774393579286;
        Tue, 24 Mar 2026 16:06:19 -0700 (PDT)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com. [74.125.82.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409c6besm15801722b3a.32.2026.03.24.16.06.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 16:06:19 -0700 (PDT)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1270f10a774so2264c88.1
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 16:06:18 -0700 (PDT)
X-Received: by 2002:a05:7022:698b:b0:129:e9f:4c09 with SMTP id
 a92af1059eb24-12a97454f61mr76017c88.6.1774393577384; Tue, 24 Mar 2026
 16:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-try-2-v2-1-eedbd0d3cec5@chromium.org> <69c30f82.050a0220.1ae388.4e92@mx.google.com>
In-Reply-To: <69c30f82.050a0220.1ae388.4e92@mx.google.com>
From: Fritz Koenig <frkoenig@chromium.org>
Date: Tue, 24 Mar 2026 16:06:04 -0700
X-Gmail-Original-Message-ID: <CAMfZQbwFwu4q-06eCqhmW-AGaPYFTFmjA5wcA5Yr7MbrLfTaRw@mail.gmail.com>
X-Gm-Features: AaiRm52ve3RluiG-aUNAU4VXJs63s0EdD_XQMH66fZisbq3IX-cq5l4R1QlRELE
Message-ID: <CAMfZQbwFwu4q-06eCqhmW-AGaPYFTFmjA5wcA5Yr7MbrLfTaRw@mail.gmail.com>
Subject: Re: [v2] Documentation: media: Fix v4l2_vp9_segmentation
To: linux-media@vger.kernel.org
Cc: Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56928-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[chromium.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frkoenig@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: 0944831D9E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 3:26=E2=80=AFPM Patchwork Integration
<patchwork@media-ci.org> wrote:
>
> Dear Fritz Koenig:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/960510=
61/artifacts/report.htm .
>
>
>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
>
This looks like a CI issue:

ERROR: Failed to remove container
3af6cab3e8515aa18b263a8011d0cddb070fa9fc24f018d3f89d5c6b0cc1b885
ERROR: Failed to remove container
bc3a1a2eae3b22087dcb8f5720f1a7dbbe3d1529205915f5b6f410af8b8dcd2c
ERROR: Failed to cleanup volumes

