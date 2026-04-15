Return-Path: <linux-media+bounces-58835-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGYvLAnA32l7YgAAu9opvQ
	(envelope-from <linux-media+bounces-58835-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:42:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1841C40675F
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5374730166C9
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A625B3E4C70;
	Wed, 15 Apr 2026 16:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJn+BEJz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411513E4C81
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 16:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776271363; cv=pass; b=OtPGdhEjRiJk7nEVwfx3ev9CyLvxOULJst8WcL04+ELWCKHWhGzkNZYAfXgOfXLNprqmQci9PmbJVB7UOiv/eNknqYi4B91dlD36iEqP2/+avi9JUk+WYJzObsG9ZskMv7Fo/4BGHD2MvxF8Q7cp4n7g25EyAObMPOXIHBsBfcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776271363; c=relaxed/simple;
	bh=BjGWHDTxXYHHMu7qSE3oSQ9dKoN4tmh2IRAQMB6g0Rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=FK/De3voWmlzdlYDaUjTYdzzSTB42X1j4KZHfAV1RlIJb63+mOG/DuKEIJi2jbafjL+MBYC7jLFOvc42mO+dh3BYWheUZrcoMD5F6fF5p60sGmOMXTU20hfO5Kvnq1RT0tr69fJ21ryXPoYUBUHl0T/qbxTACFWGobtvbxvnDmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJn+BEJz; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79a535e7c00so84550757b3.3
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 09:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776271360; cv=none;
        d=google.com; s=arc-20240605;
        b=b7t28PExb+dpspPaueOQK4FXD61yxMle9BdZWflONWrjc2aeRHF5VGYgvuUFkeo5gk
         /T76wEPhsyQPtPWrxfj8AGU1Ql/QmZxsCvSev6CxRl09MTp+WAtt1uIc2hACMZRhS13z
         qyl0WmA4VbDFtmHU8gFzsnSSqOdFIJKDR5u1w0IUYZr/hoAsv2p6ZGcd6H9OPqLgBlds
         Bc+4MjNYY+Cw1QIA1FcU33manI8FwfqNxg4DY56eji8hmUdksXvPqDrkkp8GLFy7ER0S
         DeSc9nCwfWbSaq3n8Z3DCvDxG6vT0+wEtTZibPxSv3rW+sR8mHc2LRn9t/egGjsaoU5o
         paoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BjGWHDTxXYHHMu7qSE3oSQ9dKoN4tmh2IRAQMB6g0Rw=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=LliRxCkkgxUopYg2eK4CinZT+eJlMPRklnNU7z1f0GlqxFKSfWUs+4IoBDke/quUOh
         A471I2bwhKFSf1oqp1/7c7vKmAEWzcMEM3q4K/bcDDE9nqvJ9A2LJGYXZnv601cx80bn
         +3hCIshE/piWtigk7tNT0jYKINCWgC9J70jAQ182h5KCVLzcFzEzC6VMbGjVk/pvZHS7
         UYOe8ZYt7I6/JR6zGCpkB1X0eiep1cktZwvQnQJSydK41YQF/nqtSMqQi8l90YRcdxEt
         HfZ06lil0JR2IaRDtOSLsz9VdfiC5zTf3EODhyi8UXsKBN8CHztx9oBscGOYyl23Oz+J
         H3/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776271360; x=1776876160; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjGWHDTxXYHHMu7qSE3oSQ9dKoN4tmh2IRAQMB6g0Rw=;
        b=bJn+BEJz0xLComdE0EONZZwyICi8xsPUNIwfzF3UQMroCtJrze3qoLKdWvhpkceqvi
         yybVj0yaM4WlfxPdiMEujg/aplWdYOsXGR0FW3kQGOa92ll3sQrC5JlDdHKgeoTC0szp
         AtXYWjr0Q4pwpjux7Xj7K3ktwPa39KxB34yS3/gcZo42bCTK4+nqNd+sYPa/uR7aLCeT
         qw9tEtYg9yfG3MfKvU9TpKVyqw7NtGLoKZ3WiQARKqBXRrZz0irh/nMwmBmjLkQP+VD7
         XYMsmI08O9yeiLdtzsCFsxLCd68pO7gPu+cEUp5JS9zrWqFbTMRN07MPfG6zamBGts5f
         5+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776271360; x=1776876160;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjGWHDTxXYHHMu7qSE3oSQ9dKoN4tmh2IRAQMB6g0Rw=;
        b=Of/PkZntSJKoItl/FlSNRwQLH43fFbFGuSePPAxsFcKNTFoJ8g+HQEUtPITP49YgDW
         ZfqpPRqzpuvMQDicCN8qdjS2R+t/Bkx9SmOwz1yFV03P6qRZ/K1aBkCAoE2TkD9GOyLN
         pI/KR4vGpnmmA/5chSxyS1b5eIeIh8Sl+FMMtoHIJ/lTpRCSQBuSMuyg5X5Wqp3S8Tto
         +pdyFaprxmahMaiNBB6lCjygKgOVTgWNXanuhP/tOxn+JpvPHgHMDd2npWMOzxRdGQH/
         CuBdnL0nBiSyPYgZvWQP8YkQmAdgisz8ScBnY7tKk9zR0iPbE85yhjkN6lZEzjQtyvVP
         PFwg==
X-Gm-Message-State: AOJu0YyFx2cS7vfihK2NuHyRqk6mEVwaZaoBoxZeCkJlLxzDwcby7WhB
	tXC+t+7z+sMjbVsh0ZHYthCZPVRHbfXbCCKohoMkOdu3Qh48pyCBPpkZFNUYyywamrpMyMEEolJ
	XqjPy/mbIeetzwRX7sifQDCzljLqlwkzErOuLdEDXvWyn
X-Gm-Gg: AeBDieurFD53RUZErLyDWSRLvQmb954p6n2mWLCE3q+TCLbp4zGrQKT5STOaHdzHg9F
	yhfamW6276oPaC4KgIW/4Cs4iBDLdHD4J04p1U1ujtTYK8NRcMmolV9mw4tTK/aP1zlW8AyXn+D
	xheJnNYxR+XHgES8mECy+BCln+spsmQAkMCkkj3toIktctz6jBW2cVmhl3/2zeTNmS3TAmhKQU2
	qk8OkX3PBuzdDyVLH/Oqc4NP9b5HD66preOwqsmzSuoV6u6TVIkLgLV2yB388MFzG4DXQOWXehw
	qLXSvSsHUV6APw8GZhk=
X-Received: by 2002:a05:690c:4992:b0:7b7:c5a2:fa49 with SMTP id
 00721157ae682-7b7c5b24d5fmr22420917b3.18.1776271359639; Wed, 15 Apr 2026
 09:42:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415152826.3406217-1-lgs201920130244@gmail.com> <69dfbc9e.050a0220.5ee84.60d6@mx.google.com>
In-Reply-To: <69dfbc9e.050a0220.5ee84.60d6@mx.google.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 16 Apr 2026 00:42:27 +0800
X-Gm-Features: AQROBzDKSFUvi6g_-eyacoQtx-oUomGX4Ak4dg_QTj_MfWh7wfgSDblotcB5Y2w
Message-ID: <CANUHTR9m2Vtr+QurUMzRDvdvdVSn_MUVmgc5j-2D=oXD2EYieg@mail.gmail.com>
Subject: Re: media: vidtv: fix reference leak on failed device registration
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58835-lists,linux-media=lfdr.de];
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
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: 1841C40675F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,


On Thu, 16 Apr 2026 at 00:28, Patchwork Integration
<patchwork@media-ci.org> wrote:
>
> Dear Guangshuo Li:
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
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/97574965/artifacts/report.htm .
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


I checked the logs for the failed jobs.

The static job appears to have failed due to runner/container
infrastructure issues:
it could not pull gitlab-runner-helper:x86_64-v18.8.0 and ended with
ssh tunnel: read tcp ... connection reset by peer / Job failed (system failure).

The build-virtme job also failed before running the actual test workload:
it could not pull the helper image and reported
ssh tunnel: ssh: unexpected packet in response to channel open.

Since build-basic, checkpatch, and media-patchstyle all passed, these
two failures seem unrelated to the patch itself.

Could you please confirm whether this CI result can be ignored / retried?

Thanks,
Guangshuo Li

