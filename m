Return-Path: <linux-media+bounces-60712-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJf2EBwh/GlcLwAAu9opvQ
	(envelope-from <linux-media+bounces-60712-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 07:20:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D74E3130
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 07:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EEB53019523
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 05:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC67232AAAB;
	Thu,  7 May 2026 05:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPubjAYK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C705330EF7B
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 05:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778131207; cv=pass; b=NYUSfQ5Qo4rr8oQRj1NreKDvrvBrC3vjNn14unTPNNAf1g8BbOu45H3FZRsaU7N60CJfB0haT12dTPsgJditWtpdOFVHEfxz9Xybz8Z79/mxe2n4F2/eUYKUNmlcGU6jvRbwQAtA48GKIToDy7nVgwWEfCNSDggCoDboeMErw2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778131207; c=relaxed/simple;
	bh=zqkCtEjU5mU0lQRD/RRWlfiy61nVU15hs104pUJNWGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=Koq3RbNZu5dxU26/cdJkEKB9kuvAbhFeKWZMsRBPnRVK1jDIpIMzgZPbh4OPD0FCw6vPxPs4IQR2uHTBJUDRsE/MhU1iyKkktvoRe40ki1pZUXoy5uTYvWrL81O6+qMO3m5gb4YCCj4VVyMbt8Pr8SwNqzvM1tusBa+fXo3q490=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPubjAYK; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d77f6092eso236588f8f.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 22:20:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778131204; cv=none;
        d=google.com; s=arc-20240605;
        b=VoTHlRY4TA2I9KeGAMNNQIlAcS+WGcXg04vBBl34OzGMjTn2dvuifVME8oyptHrG2H
         MXrcpYDhhCfkwT+MaS/K2t/m5Fh4eX3sKlBEt5W4xhWtysQGKaTU+kjl54L4Jvd47lOK
         hIfIbYdI4f5iIZ49a2i48oMHZ9bSVtuUs1IRIZVNday+FfmsmriVOtAZfQ7m6PAN3/nG
         o1cR2n0dbrouYvcuMiY8PfUMleUOEJl/+5sjurYS34Olj9hbRoY4qnP13M0DvKBwwIqZ
         o6iNrmVBNacX2D3Ef7oC388lWdn5wWWT77skyPZuLHuq5txSZyamHQZtuSAXU9Z1x2Wf
         1E4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zqkCtEjU5mU0lQRD/RRWlfiy61nVU15hs104pUJNWGs=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=EQ0jnpQkd98iGt8OsOYK6lCnz2b5yNhaWpycb6LFldaLzHymJN0kpkIEwKJuWvfraZ
         wzZZuYUGzLgCX8+MszjUwxcPp7UFUzacO+WGnZI8n36MowtD9XwIOd1NA5vfSebYkZlV
         ApRfzwpgWWgJj5bhYYe3vnjBDCHjUecV/RYu1RpQzfPgdyQQppwV8+ueMIUgJqlztkjZ
         JbdZ/GVdbxbZkOPZN9kyxnWJLPc0BeS3HLUa6xK3WyF4WCGgfEcwvRm1kYLwBOTRsHD7
         5FIvW0Mgl7g5VFNRwyzUDEEFCwbHWuvfD9QA7S+2U3EBHUaYosEBzTMrmp/G8E+7LzS2
         uxsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778131204; x=1778736004; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqkCtEjU5mU0lQRD/RRWlfiy61nVU15hs104pUJNWGs=;
        b=TPubjAYKou8FiI7hQFYqQFP8K/9LSY7lT36c+2k1EXoDfLU4KgJ258CBrpVN/YxZFA
         GWI1XM7ky7LzbAqhZ0slkjGDAdU+N8wiMAR8137PhJcc1IQlkWCwyRYzgE209NJZIEe/
         z5EZwW/PpqD2jpPCsnR89hQy/8bUaSweY/k3Zb9tUPpJlvBVZLZMduBDZOOYnXoImT2u
         qjEqnbxKUf2KkUEygYdFONxeYpGT7ZMeD1yn2+WhFgHW2/7AMwpU9emmnzvhY6e20BjP
         kjqOmWquNLC6YaGio0C+pY/XyEFz8LUFXxMa6Fpdwl+Fgx/JFXyFCue50nR6ghVq83Mj
         hBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778131204; x=1778736004;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqkCtEjU5mU0lQRD/RRWlfiy61nVU15hs104pUJNWGs=;
        b=ObuYIH7n8tZq34VP93NWsh6pcDp2UAVLTmmJ8KiNk8bE+t//8G45mRYcdvbONNSnI9
         UkE6x07YfiKGkmBQty6GPFGPHdUQlmt+JjAo3emE2byLpy+YSgqc+67K50fAiXMnRpoq
         9UeUe7VZAvJcYx9GUmNkfNFogOJzvCQGjqwV8DIFsDNQVutbpocNkUgkZtFgyVAD/btt
         x/5Gxw7WyMBJFGqf4ueoqENqawM5Q+Wkjv1R7lQDEnOdoYhlt8Z7LU6vRC6Z5uZgWcN4
         4chAXtlqxw6hDaYa7MXPzobw/Guk4/Z+SE2AXDfMNtL5dRosMnbh8PaPROzivBhxHcSk
         Gc/A==
X-Gm-Message-State: AOJu0YwC+BhhyZwulyYsrlzVcx+1giDBrwAg8Fhq4Q0HhvarVE99N6/p
	mLc4mMyMMrZxGdPKi3NcWfKP6tJsSS11rC/TP2dA8fPRMNc3gnyctO4N4lRGYw87I6GZI8Uz7Ic
	9q2EYvodBMG0iDHQxio5iJpLkAuFqB5GRKvtajLQ=
X-Gm-Gg: AeBDieuy4ZkTDAmoOz34xVEuLyI2I5QyHWWbVY6r7Qjr1sAbd23t2lVkaDcM5BYgiTc
	kXiky4plU5kVc6y9dl7ea/Kgqw8J5tIZqClfdvm7KspbcKIRwE9GShfr79kyuyRApzPdg3qpV4i
	pGdWKU34xZB6NHNKDkgjbkQiJPf0+0amy8Y7873h2Yftf1sNNYBLtEaTkDS+Ys2GcBMmGamIWiJ
	cEYp4PeIIBUnpS/ZKHuGX0XycGd5t4yErfTgil7Zkf995uQF45QsvUUePir/GVnMipg3rPlDcEV
	1rtmPno3kUEuG1wU8U0=
X-Received: by 2002:a05:6000:2dc6:b0:439:c661:3245 with SMTP id
 ffacd0b85a97d-4515cc31e43mr10856106f8f.34.1778131203654; Wed, 06 May 2026
 22:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504103656.32945-1-shyamsunderreddypadira@gmail.com> <69fbbd91.050a0220.15ac9b.9d7b@mx.google.com>
In-Reply-To: <69fbbd91.050a0220.15ac9b.9d7b@mx.google.com>
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Date: Thu, 7 May 2026 10:49:52 +0530
X-Gm-Features: AVHnY4I2Ol4U2X4oP0CEzZ-k8tv0u27EdYteKfqq7lEbwXvqMY7-hvVSH2lnwUg
Message-ID: <CALx+fbb9=s4w8f-_uaD4RHFpu_WsaQEYnrxdoU0ydcWoF-m_Xg@mail.gmail.com>
Subject: Re: [v2] staging: media: atomisp: drop unnecessary else block after return/break
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 976D74E3130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60712-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shyamsunderreddypadira@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[media-ci.org:email,mail.gmail.com:mid,chromium.org:email,pages.freedesktop.org:url]
X-Rspamd-Action: no action

Hi,

I noticed the CI reported a missing Signed-off-by from Ricardo
Ribalda. So, I wanted to confirm whether I should add any additional
tag or if this is a false positive.

Please let me know how to proceed.

Thanks,
Shyam

On Thu, 7 May 2026 at 03:45, Patchwork Integration
<patchwork@media-ci.org> wrote:
>
> Dear Shyam Sunder Reddy Padira:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
> # Test media-patchstyle:./0001-staging-media-atomisp-drop-unnecessary-else-block-af.patch media style
> ERROR: ./0001-staging-media-atomisp-drop-unnecessary-else-block-af.patch: Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99166082/artifacts/report.htm .
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

