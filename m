Return-Path: <linux-media+bounces-55796-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ3oBuPQtGkTtQAAu9opvQ
	(envelope-from <linux-media+bounces-55796-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 04:07:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C928B770
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 04:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9BFC304AC0A
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 03:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA53C30F932;
	Sat, 14 Mar 2026 03:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkQHWjiK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085552E975E
	for <linux-media@vger.kernel.org>; Sat, 14 Mar 2026 03:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773457627; cv=none; b=qN4M5uNEkYy73PLLC+gSlu9s0uqcbRgF0Bh19Ac+b1R7eX8tMe5vWMFTbpTfCWAN56a1rajRESk3mYG/Owvc9QVDyQJ6lBsYwEw73cugWOMsEDdBnZPdiEa3BMq8RFVOkFNXToDZNtILKjycceOr+CMMMB5WoOmqhgHsAxbKsDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773457627; c=relaxed/simple;
	bh=LNPJW4w7O3Oh5vDFiHstxWAuYlj+7Nxd+1dxFb0UT4U=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=r3/BkOSj9Zh7n6tDincS5ZIX9MTXB4tSi0YrNJ6EtfXzF7U/1eRGC5K4Psr3iG15rXLlcRLMracCEHLoHLh7I99GAFU9cMhtSsOiEtroF0eQ6URjm7L6FUKL/Tg2wkqn5816ge/Cg0s3M7zKncBcLeAvSfn5qALdFOwUQHNOX+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkQHWjiK; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64ad79dfb7cso3439676d50.2
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 20:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773457625; x=1774062425; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNPJW4w7O3Oh5vDFiHstxWAuYlj+7Nxd+1dxFb0UT4U=;
        b=WkQHWjiKEceKBUGZbZzT6A/0CLUgOzw0+gmWXr6pQvTzYASPLTi4Yn13M/TuwknqZM
         aEeFAFemI3FJPLUQ/wXmAX61HLOZmHrU2y0XeJ2Ay5rFs42vBtZV8zenh2Cf+BOXTOoH
         SN/8KzG1Qb4gKqOnH+o7vKctlW5KgmX0Vl+Oq6hQReJLGQvG5eUgDmoN76r63Jfj9axn
         GveFjsnvv5Sdm3GGrmWg5cmqcjMLtwk/YQNOSpinB67Jd7oCctShdT20s1jChmZiQtKj
         NynUoQT6Rdkp8vadyRLS4cs08MPWKg6rPTwwEUWcmAznMasHdpT75CVxZpHhdiDRCfl/
         zpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773457625; x=1774062425;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LNPJW4w7O3Oh5vDFiHstxWAuYlj+7Nxd+1dxFb0UT4U=;
        b=iDZcriHtgfWidpHX5oILFfBPIO+UO3zR2AeFNgF8f+BmpdDovDar7ZUpeaixpUVrrW
         nk1ZoywuU4Wsjt5Kd1bFNdaDqCLMcpZE5qXBYs7ynm8tkpGWTuuotaEKtbpqixp8va3X
         1AxwMfH/aGcdwK4toke2s2ieILmFMEr3n6ulO6g0PqhLFNxJkI/HKuRqCBnDv4AU4BIh
         kV/giixR8LTk0Ly8lgKV5ADiMa2ouZa1y0Hv7mtNK3CnHe/60dZreoPa5FRtxsPwF1wb
         zw/oeXCTkWJzdIxMUU4mBUT1rbn5r4fZtXyBBUb83s/CTZBYsylVlPAhjtj0/WGnp1QO
         wZFw==
X-Gm-Message-State: AOJu0YyW/l/qOrTzg9nQOvb0gvdtMhZzbuVnQgoLh6ZLQD80DjdwMJM0
	1X4JUJEzDQK5pb1p4LaTvT19Mf2Ps4L5Zx6zoDQi0JdGw449eu71RrGA
X-Gm-Gg: ATEYQzyBtQ7+MsIrIz9HOyeEGRapMXIU1Z3txeycWRAGGQ38snbiku051QTab862BPU
	3IceTKm1E/cT7E7xH6vluUIuQ6s0spNoJlWntJVtMJTIzP2gzeGtbWd8l1s5z50uEOU1wdE/251
	38wRtS5sGIopdR0G6lLSmOhKQFm4B+z7+5g8Ftuv1oDP/MZTYFgW0YyfLGhIY1evqyUpMkmNZXX
	1cp/4Rvnj++zwBp1JoQkK7u3mS7X34KGgReoxRO1PmPMpTgpxKmRQPH1w2T1ZdSEUTRGToqVGjl
	+0Jj2/PhhomiqgvI89KRxgCXH+srbx+Hbu6CqvPHEVbWffubabbCOAudUluOM/jAGg0tVbJxZKg
	UEfZVUNA59BzVs3iFYVNrvCAyF35TlmUsYDQ0UlvQ9CXKh8nv/4ywBr3PjOyWh+pyELbOzBImqV
	T2JvtZN326NSz1j4BqrCLFvpTg5xghH1XCWLjX7SVNmdk9NNol+/AWCle1g3gha9BABLST/Z0GK
	tDEBOVioi12jL7K5IHXnQ8VVH+RNIe7
X-Received: by 2002:a05:690e:2485:b0:64d:d0b5:3f35 with SMTP id 956f58d0204a3-64e63094ccemr4019389d50.67.1773457625078;
        Fri, 13 Mar 2026 20:07:05 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65b39cb8sm2116487d50.11.2026.03.13.20.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 20:07:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 22:06:43 -0500
Message-Id: <DH2693U3WV7A.3HE6S9RPAFP4E@gmail.com>
To: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>
Cc: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Hans
 Verkuil" <hverkuil+cisco@kernel.org>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Jacopo Mondi"
 <jacopo.mondi@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kees Cook" <kees@kernel.org>
Subject: Re: [PATCH] media: subdev: Fix error pointer dereference
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260314030228.1133429-1-ethantidmore06@gmail.com>
In-Reply-To: <20260314030228.1133429-1-ethantidmore06@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55796-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 932C928B770
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri Mar 13, 2026 at 10:02 PM CDT, Ethan Tidmore wrote:
> The function media_pad_remote_pad_unique() returns an error pointer upon
> failure, not null.
>
> Add check for error pointer and extract the error code with PTR_ERR().

Detected by Smatch:
drivers/media/v4l2-core/v4l2-subdev.c:2588 v4l2_subdev_get_frame_desc_passt=
hrough() warn:
'remote_source_pad' is an error pointer or valid

drivers/media/v4l2-core/v4l2-subdev.c:2595 v4l2_subdev_get_frame_desc_passt=
hrough() error:
'remote_source_pad' dereferencing possible ERR_PTR()

>
> Fixes: a564839e630c1 ("media: subdev: Add v4l2_subdev_get_frame_desc_pass=
through helper")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---

Forgot to add the Smatch warnings, if this version is good please add
this to the commit message.

Thanks,

ET

