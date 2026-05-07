Return-Path: <linux-media+bounces-60711-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id awKgATsf/GkfLwAAu9opvQ
	(envelope-from <linux-media+bounces-60711-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 07:12:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6873E4E3053
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 07:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3A11301D321
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 05:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A594326928;
	Thu,  7 May 2026 05:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mb8PNbMz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD4126ED41
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 05:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778130740; cv=pass; b=MO7Gbwx06BkZBa6XUbs2ZcYp3ByxX8v2tg/PenD66Hc9rjHi1X1wB0alyz6Eu/bwlSVZpjkm3M/EZqt8i/nhabQuQoWT5D92dQiBKe1Hn7bwGdWcQgEbJ33l/XPTMDeL0a7j5oF9rC0QsL7n7oznKj/0m2Foeppa9wJ9oMiJazo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778130740; c=relaxed/simple;
	bh=fbncoqMIGmGj0iqGTDtQInjZuGNvpnBJ0wDBdv7POrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=DiIOso7CW4fkn3mNCv3senA+Ge6pe4aYChNr1H7Bl+ew57EYczfI+YcFFgTQ1OdNbixERe0dftEYmUnS2wlWyrTVGsosJvs7/uoRa5sc1P/lEuqIDjtGFL//38RhxE6ayGNkbu+b9pN89jYUewxbdWsdsNeyA50ixBIi57cNDaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mb8PNbMz; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d73422431so331115f8f.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 22:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778130737; cv=none;
        d=google.com; s=arc-20240605;
        b=j5lZT/RjQM1sAAXZqgcLM8rxPnujVJtV/X25OQQuy2KVwPPe/UKl8USpm6qaj8YbFC
         uDmRgOYOyePKEGdx5KuAGyd6L1KXc56U0rMYd4Zkj0IRO0fWBSlc1tPvnHDlY61s7vhR
         4forMunBYUf7sXCvYVgaxIto8139WtC4bH5ssfYnQNts6l8vsICXCibDeZk6t/PVA9fF
         xVBNjgbyTSObI+wNmG58e5qgn7cz96rqM2pBf4zw0LXipMae1VvsdPR1CVQ/vGtT84wA
         npw5BQ/ClFYMwIlD3Tse8ofxdlOg2IJR3mEgilf0IMHLegPV2paNa7iabmEmZMbhUFGm
         DpzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fbncoqMIGmGj0iqGTDtQInjZuGNvpnBJ0wDBdv7POrk=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=TotCVe+ywbZ4fX9MdwtcUAXw4dzsFn6WU3WRfTPIqeiM2+MaAbFv+x8K1gMNR72jgI
         RG6n3AZZlfq4uE8KDwdfZzzpXdcuP60tek2wfm++i2F8eIXKVD9V+ljeqDe7hg4vhL1i
         S7zRGHhCTebyftgYVzXM4BP9rJhdxhLmwUFz7zfOelCxGHYpVxGiHlr375IGEkHt617P
         cXarigiEEQKrF8MgXEFBp8L6cB2cr1FikThEtogbZWwKohaZl8KLi3Y2GqiGqYBmpdqy
         VV4ceI8OkERC21IJgpnjW3yM5Z9iOydQbbJx4KIG1+86Fd08iAfLMdGHg/lle3o2gf+S
         ljuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778130737; x=1778735537; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fbncoqMIGmGj0iqGTDtQInjZuGNvpnBJ0wDBdv7POrk=;
        b=Mb8PNbMzLpfajUfBxDCDcMMX3upJbgFjqdacG9pBhVzhwf4zrJGcea4q/FciyjFcWZ
         KXhaeBMrpjOhxwbaix6nQ16A7MjkfNVhpTf4A4IfMFGYmmTrP33CI3d0SFGo9ttpnp3s
         LcM7nC0NiSw1mJuNTrTgWFY6Y8YWcrUvH/CKqhHsbVBy0a03a6gjB6FMrN1iPR0xkYXS
         3gFNjbk8Gxvr7svXtVGgOdJjQYzdqAZV0cyuV5UTXpZEmAppHOjlvIUBwnZbwZ+NYM7+
         Yh6enSgK5V5BtOAleA0IXt1qHo/ZOL6gCsq3W/ZQ3IK/Hg3Za/2rJTvjzd3Y49EXYGRr
         kjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778130737; x=1778735537;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbncoqMIGmGj0iqGTDtQInjZuGNvpnBJ0wDBdv7POrk=;
        b=BV2Mf3Xm9WHsMQRDZqzO0BoMy1DgoMCOtA+4dWkVAvWKi9VtGGCU21RRRHmI2CH+jS
         ztCRrFDdA6rCdDJUfWuAaheFbBfu5zM04n3KqL9KiCq/4Rp3O1Di6SM2C5m7k8nyLnpy
         YPHiauSzexFlJUEYqDglVRVyp0Li1tjp7IFDmGESuVM45zEOaRJV61a5GFxFwqrgEL4E
         OZ6eEoe7xHVbmuWK8iAYGH7YOzXKvTfThNkfFshrAtmeqJxnNM6tU77gdt4cTLgKlTdo
         pcmWm6kWaMHAXPH/MOQg+1mhB+FWuApAGhn6bItwrpib4iZjVeYez9SHiAUYU6Om9rLA
         XMtw==
X-Gm-Message-State: AOJu0Yx40bxdLIIWiqUsZfe9Vqt5uY+gt8j0CTuGsptLNUYi+A4CKnlR
	zH0Vlq0qp0WXHLTOOvqVez/Jp4EnQHkXS2/yHx+bn5pe7FoRhR2zDAUo/oGdp86ZY3GnJNEZlG1
	BAEE2USMwLy45+BBmkCoMaF+aLyT2lW1kkFVILk0=
X-Gm-Gg: AeBDiev5OEUt2O9WzgwQRCPTMBmz+bufwTHzdWjM7aF+aoSdws+mwd/DCIySn49Z9Rl
	D4cIhAnEGaWktj4+760ViV9MwP14HulX4yh8TPOOQ5LqhvYMo//Smd1KMjwT950neMqdEAsKpej
	34Al82IZ8g43nJGqeCQUhaULhjRfT/+oCAkji0bGfZkzhfZRdAxLA6cDbGjowz8k0WPlE/weyZ1
	UafqwDE3Kbmp51eu2H4POXj929ni7F9/2YnneSbBJXgos9wF1VfdUHhAKWcuMrX2+BUMKLBtoWh
	/FeZ8FDIAHw5H9VotUjoe9juQuVByw==
X-Received: by 2002:a5d:5c84:0:b0:43d:1bf6:30f7 with SMTP id
 ffacd0b85a97d-4515b9f3935mr10441329f8f.18.1778130737316; Wed, 06 May 2026
 22:12:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503150027.107173-1-shyamsunderreddypadira@gmail.com>
 <69fba4ea.050a0220.3a85f6.7024@mx.google.com> <CALx+fbYMwJCvRvGMirfDHeA=z9_SG1EJKse2z7MZJBhSsFbxFQ@mail.gmail.com>
In-Reply-To: <CALx+fbYMwJCvRvGMirfDHeA=z9_SG1EJKse2z7MZJBhSsFbxFQ@mail.gmail.com>
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Date: Thu, 7 May 2026 10:42:05 +0530
X-Gm-Features: AVHnY4L-dfXKN_PVi6xRUwIL5M30kOZgCyUOrtbQYwWQ37HKWKvF8d9txYM__1c
Message-ID: <CALx+fbafjkQ3TEfFKpzdg7wCh-HVFc9_GiejnV4B5n3_aY=7qg@mail.gmail.com>
Subject: Re: staging: media: imx: remove unnecessary out-of-memory error message
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6873E4E3053
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60711-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shyamsunderreddypadira@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,media-ci.org:email]
X-Rspamd-Action: no action

Hi,

I noticed the CI reported a missing Signed-off-by from Ricardo
Ribalda. So, I wanted to confirm whether I should add any additional
tag or if this is a false positive.

Please let me know how to proceed.

Thanks,
Shyam


On Thu, 7 May 2026 at 02:42, Shyam Sunder Reddy Padira
<shyamsunderreddypadira@gmail.com> wrote:
>
> Hi,
>
> I noticed the CI reported a missing Signed-off-by from Ricardo Ribalda. So, I wanted to confirm whether I should add any additional tag or if this is a false positive.
>
> Please let me know how to proceed.
>
> Thanks,
> Shyam
>
> On Thu, 7 May, 2026, 02:00 Patchwork Integration, <patchwork@media-ci.org> wrote:
>>
>> Dear Shyam Sunder Reddy Padira:
>>
>> Thanks for your patches! Unfortunately the Media CI robot detected some
>> issues:
>>
>> # Test media-patchstyle:./0001-staging-media-imx-remove-unnecessary-out-of-memory-e.patch media style
>> ERROR: ./0001-staging-media-imx-remove-unnecessary-out-of-memory-e.patch: Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by
>>
>>
>>
>> Please fix your series, and upload a new version. If you have a patchwork
>> account, do not forget to mark the current series as Superseded.
>>
>> For more details, check the full report at:
>> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99166179/artifacts/report.htm .
>>
>>
>>
>> Best regards, and Happy Hacking!
>> Media CI robot on behalf of the linux-media community.
>>
>> ---
>> Check the latest rules for contributing your patches at:
>> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>>
>> If you believe that the CI is wrong, kindly open an issue at
>> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
>> to this message.
>>

