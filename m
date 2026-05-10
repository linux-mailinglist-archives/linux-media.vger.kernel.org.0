Return-Path: <linux-media+bounces-61012-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id h+uPDAUfAGpBDQEAu9opvQ
	(envelope-from <linux-media+bounces-61012-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 08:00:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EF6502C05
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 08:00:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ACF0300B12B
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 06:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682C823BD05;
	Sun, 10 May 2026 06:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1wWEojQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7118A2836F
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 06:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778392830; cv=pass; b=mVF0n0timpHPU7sYaAaWeYX3D8KL/IzUu6ExEDnT62MyHTdkAPXv7/7YzcdP5jQPdu4Sx5dDfWsa03B3iROlaVvamNDS3Q0q+23mVG5ttfu9akSpKXQ4EPDfsVqHY3oWiznc1ESBrvXUCfbwGSvBRHwMdu1UGz8W8XV09luUe4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778392830; c=relaxed/simple;
	bh=Jj6h94EcS+B9LhhwkwPq7jEjI/eSGYZYofyEFrW3ph0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ggW/Co7oB7VjmyYgif2t5kTPipZS2ynO99aM4l8GvpXZKpgwSIIzsNuLubQ8hGGD/CxWXb45HV7amr625w/1U8NxGtcLLZI5mGOpOEPyw3iaJ00pp03xAhRrh+DhfhnXw78alVVNgCR39xCQgBhhKFChTZNNr9eWrK6xynPAarA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1wWEojQ; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so3371318a12.0
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 23:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778392827; cv=none;
        d=google.com; s=arc-20240605;
        b=DK4baNh3SRdRP00S7swJQkcGKiGdcHbPglnbdYkJN4yaWtysJi9UyAg8kGFhOBB+Pp
         JHyaptPik29nisnKUedM3HoChFaamd6gqpc6xJb8TRM6PE+6lrqzOgQwwBKTI50GUrzw
         tHPeJEKueFbIQeuSg0qWic1tZsJguLvxQ9ShN4a+z2oFRKBgspp5ujo7NaTqufBE5XPx
         Gjah8+9RI9I4OX+aCDihejyfh8NnV5f+1Kgi5Jbvvz2iYUmURDqZpbuBeAOEJdPnxQPf
         eKnDxuYfWFfV/CXuWIRFK/iooBwUOcLLvnbqZZAWOEatw2lFV1XAlVDNf7igsEGQLWPm
         VCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jj6h94EcS+B9LhhwkwPq7jEjI/eSGYZYofyEFrW3ph0=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=INbOMC91SGnGW/K4TEl13uRnNSyAiloFvFAmLOwjmlnINt8KNbiXsFbUnipSCNxp/I
         mK57TDRg97IUVF0oXz5CVDx9dtNDdIKa9vg9Y4tambt2AZEgJ9o6l1TYUQIQkWEmHSUN
         wa8ofKHaRUPObBBwySXXq7gAKbGDny6CG22zR+oaDQ1NrTr0Yt5ZYvEBttx8KBoRaod+
         eBLsPnOYUNZO62V3bt3929wTOkV0cR+fiwzSDGu+yG9WjQpU5Bf2vZaTDOi6xYBoBPGg
         t1rySvxtNfuwvb9DNCyzkXH/sy66yw+xE2JAGah8cX0movccKxFScOYgk6FN2JIUMWzk
         ZKaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778392827; x=1778997627; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jj6h94EcS+B9LhhwkwPq7jEjI/eSGYZYofyEFrW3ph0=;
        b=q1wWEojQA+zPws+KUOSMYDhcMpFa8U4ahG2Pa4HZmcTIcppww5awDmiD4MqryuJFGx
         0asx5Xk5igIpMRcj0uBrec/eKW8XfjhiUbKHku4vszEoohqeHgyqaT4J1ZzDS1YDu90g
         4Dn7ebmQPtkXrx14n5X3RKcaCTZDLYbNymS5hSrQ+PnCM6cpgK2Y2Zv+BRjXKc7PIBam
         QcMvc8Tv937NmsWASRa1fHLdyX6yBqsC5sOQkBwJSOdvUMqWA5bBss1ytLWlBXvey0zi
         iftv6HUnCYFnT1znlEJpLc1dTuq+1V6yO+U2HX+a9fyXUIdRmHepPDyAU51c3afUffr/
         gpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778392827; x=1778997627;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jj6h94EcS+B9LhhwkwPq7jEjI/eSGYZYofyEFrW3ph0=;
        b=l7MlGHffoinCpNlfO9NH/Xn6rcG8SnSURR+HIeXt8OVTTKKdTuvjo4/5uBdI/IrLcF
         wcdAv5kjD1icjzyH5WnTIBdPzKUQcILHp47KOVouB0uTnbBjdL2QBxvCRqqi5FtRmME6
         Izv37O60B4iAQMdXhrqdovv4JCfbotPftpJdHtAUOlMtI7BD9oqvv89GIrxCVu5pJinb
         okMUknyY3uvA7OCK9i474OBJm5kWQW5LPa07HDNRnmA34RycV/+nZ/82d4WiNRWTjyer
         SH2PLcqfATkVUEXTQ/TOLgBo67QZzD0C0VQmM7DF/am9W4zp7x7k7DlX9DUaQz3ioc38
         8mLw==
X-Gm-Message-State: AOJu0YwYt8PfIuLvTH+pB8rlEJ+je6+UPh6QD4xGYnNW7NJXGIMM48lB
	IMwkKorR+Q0G1bJDPj7OJxrRU+EUTLcMrqfgGYcsy6ZFQF6BwW+CvTBvsBAHdm+T4eo83EUiCQ7
	JiZuHfWmoZV+6vUwqs9ELFWNnwmqYwYWN0pC/wg==
X-Gm-Gg: Acq92OEuPJXRTeyyO2jcqz6cxj3ZsvyonIUacw/VjW+1bV2ZNMXDjCTNTBZbvu3XRgf
	Dk9V5w7gzdcHRkC8mvsHJRf2baf7NtpkACBEBET3dPMYEnD9PoI2rtIWgq3Q1tPI7FGyulnrYy7
	RUbCc7MVy29R8FdUPcQb4wGJP6uSxGrmmV3xrEVaHeFi+com4QvmwpXc/mxOyrmnBCaTYdNXB1G
	eBONcHrt91grAWdCWHzXD6muCXvFXnS9X7tILdvhJ21UuDTOCSkDYHDhCoxKQfR/0kuDceKe7/Y
	cvBHI3TyvKmm6owPHqhxHry7TVXW8PaNeiF9
X-Received: by 2002:a05:6402:534a:b0:676:dccd:ce37 with SMTP id
 4fb4d7f45d1cf-67d638a6f3fmr7182068a12.4.1778392827245; Sat, 09 May 2026
 23:00:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506124124.27802-1-mhun512@gmail.com> <69fb6a49.4a0a0220.3bed37.be01@mx.google.com>
In-Reply-To: <69fb6a49.4a0a0220.3bed37.be01@mx.google.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Sun, 10 May 2026 15:00:15 +0900
X-Gm-Features: AVHnY4IPSGVjlaAbdT8RWX1dqnyPUxnclKKZCtzpaJ-woGNDMI9D6HuASxHWdVA
Message-ID: <CAGEsz8H-drrG=Mwta0BKse6KfX7sQSrbuQWLb1zMSXQ7Z8wMSA@mail.gmail.com>
Subject: Re: [v3] media: cedrus: clean up media device on probe failure
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 75EF6502C05
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-61012-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,pages.freedesktop.org:url]
X-Rspamd-Action: no action

Hi,

I did not add Ricardo's Signed-off-by because this patch was submitted
directly by me and has not been handled by Ricardo.

This looks like a Media CI false positive. Could you please confirm
whether this report can be ignored?

Thanks,
Myeonghun

2026=EB=85=84 5=EC=9B=94 7=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 1:20, Pa=
tchwork Integration <patchwork@media-ci.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> Dear Myeonghun Pak:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
> # Test media-patchstyle:./0001-media-cedrus-clean-up-media-device-on-prob=
e-failure.patch media style
> ERROR: ./0001-media-cedrus-clean-up-media-device-on-probe-failure.patch: =
Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
>
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/991642=
68/artifacts/report.htm .
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

