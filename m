Return-Path: <linux-media+bounces-64332-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m9pmNA1zKGqgEwMAu9opvQ
	(envelope-from <linux-media+bounces-64332-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 22:09:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CB8664064
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 22:09:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=tumelty-co-uk.20251104.gappssmtp.com header.s=20251104 header.b=y3zjQ0Op;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64332-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64332-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6FB8B3014A8E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 20:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60A737D11F;
	Tue,  9 Jun 2026 20:09:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F22370AFF
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 20:09:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781035781; cv=none; b=UTAqPd7mHaQgJuR/Dm5TQps3ptgl6bp6T13fwPcumIQe2pgvz/yvjznK7n/3xxqomjrt0iRzFv+W761BqegdKaKGVenICB8knFW8H9OCByCetLZb3b7BaWKEpanl8GFM+MJwtX7k9KwYfWb1/tP/z5Woyl4+xNi12M3pG0bUrI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781035781; c=relaxed/simple;
	bh=lx5ZWUquywreDi2B6SPS6Ydj3h0qvxn3nGLGXsMAt9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qaniwKIH9HjLEhFH5QxX1amMHa7BJyhqqI+v0y7LjoAaEl6dy82tb98if4M9gFW4XUyLZRNOvMrFho/4PuVcmfGbct5IJaCAHjqtDu57C/PqcXtgb3/3J46jWX076bzdS+HzBOKtVY28HCHg8sUUjPk7HaXIjpBjA7rhwiYQBiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk; spf=none smtp.mailfrom=tumelty.co.uk; dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b=y3zjQ0Op; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45fd45e596cso2970020f8f.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 13:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20251104.gappssmtp.com; s=20251104; t=1781035778; x=1781640578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lx5ZWUquywreDi2B6SPS6Ydj3h0qvxn3nGLGXsMAt9c=;
        b=y3zjQ0OpZw3c9jG9j8f3wn30N1LeytSOARnSUxmytznp+TLEWRfiTshLKEWGwUGrdi
         WOTfO5YYNMszR+5OjlXYOL7lBaC1MbuF2Ait4a4OIJOeOYIBb+4xO99PcdctL+NZFlUs
         pDS3bk0W/6T6bZ3oZGtroWh31btenqaFQe34Ja9XPz/ifl0I7bInQ4F2EHhFDoy7Drlf
         VAo0qY1vr/0vg69ZjlYxCZH70jKFgnxJw8v51l1es8YgUMd9DVtShZFF9hOwibY7Tg/S
         +0l2IsASjMoF1oNIP2eivBAupiOMmHYy8x3UHgBTokaVsw/EbdSaPaEou2iFJbqDlx9p
         WrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781035778; x=1781640578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lx5ZWUquywreDi2B6SPS6Ydj3h0qvxn3nGLGXsMAt9c=;
        b=YpzK0EMumlRJKrn4JJqOGl61QC26BX2mxOqXVeTSShDEvkDaJCVTtRk+pkFZP5KjTD
         P5V3sbmI7MWy2pYvrgr5Sh5lE08DB4s1hjSDOxwuwrWqAMpEm5LlK80kbgRRic9qxubS
         CGHF6OUsqyZ09H7DK7dmB25vwfnfTsQ+uxkBjfaKzQrjex2J1KWHB3AhwOH5TTvIqCzv
         KNdiMgMJX9fWbV6AIrsVKEWHbx6mh+6OW5kwb9W8wQ2k2YfWAlfky8Q7wT7qxb96YFLb
         pUh8/f9/sM5VYMF72Tm/jTmldMKgIY+HafiprT07oLvnOYoNm4TRwHZMyqi4fK3mgKrm
         89bA==
X-Forwarded-Encrypted: i=1; AFNElJ9LhJVysMtHG7d+Wbhj/Lkd+LnYlHfcqXNthUhxlA+zPb16pmmt8A01iVSZS3UZ5PFn/QOpayWSW+tTzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwEcJEas4gffrsRc4zJoayqEQr76gpQ5yseSVzYPiKI85OM6Oz
	zvO95DGKXP+VjmnKcsmLHo3MyE2SRHa7810LDywAtdT7ZzBcigdrSMp/HjBA0EBD4VQ=
X-Gm-Gg: Acq92OGnqzGCshcUhYCkUJ0hd4LR+D4ibQADORWMBK6sQcEISSoO4+pLzptbkbxe6w3
	GB3ACpTyPQ+kSs6mqRfwfBOJc3iX/MJnvKsTc9K80RSF50CUVjCV/hRQC8h5J1LqzUqfC+nMfah
	hYbLde11tSjR91bil+6eDpjqSm7mKrO9oOdo4p6HW5I9yZWARvJb7ZmqtNN057vroGY5szGE5Nz
	GafbroFj+966bHdgYuNbnWqNdTZ5dhfEdh0ZbpQsaXBgMLfx6wRVQM1ra1yE5uQoJR3myHc102J
	4CB0+GZyVfmKeBncmagPm3zWyOBAmbeZ7rXb+whI4HFbi0Lav+9dE6WfaBCzY+eEqS/ULDyCCuy
	byyIeZGs5vI6iZkxD2h8sqJhZjMV5il5NIYtMyF7nV2UjB26higeXL8/gytXaA2pzpLdG8rmIs+
	zILetgdW2Ugd2C4+czpHShwfM=
X-Received: by 2002:a05:6000:2912:b0:45e:e44b:3147 with SMTP id ffacd0b85a97d-46056680a66mr5598468f8f.5.1781035778244;
        Tue, 09 Jun 2026 13:09:38 -0700 (PDT)
Received: from nixos ([83.217.168.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm71280456f8f.5.2026.06.09.13.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:09:37 -0700 (PDT)
From: Rhys Tumelty <rhys@tumelty.co.uk>
To: andy.shevchenko@gmail.com
Cc: andy@kernel.org,
	dan.carpenter@linaro.org,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	rhys@tumelty.co.uk,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH] media: atomisp: Fix local variable shadowing warnings
Date: Tue,  9 Jun 2026 21:09:29 +0100
Message-ID: <20260609200931.670292-1-rhys@tumelty.co.uk>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAHp75Ve3Cs95e4CLHDfO0_T=gSDa2tDBS+eZTAJoHxWd_zWMAA@mail.gmail.com>
References: <CAHp75Ve3Cs95e4CLHDfO0_T=gSDa2tDBS+eZTAJoHxWd_zWMAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[tumelty-co-uk.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64332-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andy.shevchenko@gmail.com,m:andy@kernel.org,m:dan.carpenter@linaro.org,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mchehab@kernel.org,m:rhys@tumelty.co.uk,m:sakari.ailus@linux.intel.com,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[tumelty.co.uk];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[tumelty-co-uk.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[rhys@tumelty.co.uk,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rhys@tumelty.co.uk,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,tumelty.co.uk:mid,tumelty.co.uk:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67CB8664064

On Tue, Jun 9, 2026 at 11:42 AM Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> Before even looking towards (some of) the W=2 warnings, please pay
> attention to the real issues the driver has.

Thanks for the feedback. I'm quite new to kernel development,
and I'm mainly just trying to get my footing on sending in
patches, currently starting with W=2. I'll have a look
at the TODOs or any known bugs to see if there are any minor
issues I can trust myself to help with.

Best regards,
Rhys

