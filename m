Return-Path: <linux-media+bounces-51997-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGUKMep+gGnE8wIAu9opvQ
	(envelope-from <linux-media+bounces-51997-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:39:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D2ACB165
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69B3B303A5CD
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FBD35A95C;
	Mon,  2 Feb 2026 10:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnvqlEEH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AB5359F87
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770028558; cv=none; b=Vz7VhsW2POoanPxxBtziQlIUkr8pQm3Iei2rAvfbCdOe8YvJqszVw03Gq9qf4mVCEClvg1rWEnEnve2Gc5Ewy4HAhOmWEOBVR87cyefspgCErjc5kxYLzYiU71Ay0U3GNcAale/cSbrN7Kz3PXxYalCLi90Q1/D5itDk3EYJegA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770028558; c=relaxed/simple;
	bh=u3nLWsv+xZHspUdaarvrIFfYRC4HITj/S9WkR8PPpmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZbYl/j4Yz9WxAX0T9oDkasHl0zEw1/zrQdHP5/wiEOA32rXNs2iy1VYBg02AF1+GnpDZ9Y2h92tPORovfc56vOVVmxqpXqLa9otKDQdRzg42u8IhukmQsiLMGKX+e+yHpewPbXaTe3rtwoUFO//OaqWGV73EVoT363UbNJdIFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnvqlEEH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806f80cac9so22215315e9.1
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 02:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770028556; x=1770633356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3nLWsv+xZHspUdaarvrIFfYRC4HITj/S9WkR8PPpmg=;
        b=lnvqlEEH5HXGLckUzV0HqPQKtYR9RRxOxQmCg/A/IBr1QFsoJx/i4cXVQUb8rlF75J
         D/whHKJRfBPmIUZq3KKaEncBZxVV+V+E5wTRmBPgJsv6LaSaCkuyFfUgy8FMP7Pu0TA5
         POxLL/oc2ipiTqx8VPKu5GWTDh6oOOiXkmlHRhcDelGoNB7NVDpIQ1y6Uh7Twpjjbcfg
         UW5kSEJyeqr6OF5YroWfbscOWXOJSuOUYoAxRls+7CGyWjPWt0KVTQCFRDYuSUWDuMue
         VnWGH67VTnJd1Z+Tqie2S3KBYgOuT4syIb0zdpDGFTwEGIb0O5nRhohSRqLNQ2PtmFv9
         BP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770028556; x=1770633356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u3nLWsv+xZHspUdaarvrIFfYRC4HITj/S9WkR8PPpmg=;
        b=BlGhSg5ECuH6G52owWx6yaie/wFgETXZw/dvOR/SMtKQL+Utnr4+BcrbrkLG00J+yp
         t/SfFHevEuXH09JjtBR00l3Rxxg0UasLsw5jd7S/FLfNR9d2SwRZdlNAVp5jqujC6RDA
         RnV8DmQyBCqVnehWdy4nohV2ut9Md87leezedtCRjlK9ijJFxR79c61fYkMWtwldU6mL
         LV99cw/GdqvMda0/nDypvIK07GJJP4oUA0yfQjm/AV0voQQrYVtwEO/SJ9CdXxVVrvtz
         xkUy4QazOxhkD/abJercN8V3eeqGvU32uYyD/UgTVumaY018NScJGsxF/QRn5ts+umUT
         QQNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfcH7LO6msXHgUMdQOcyT+JG97y6qGBMOdq57O4nSXJ0/EiSr7d66/Ns2xkjvNgKvSKHxrjQBAcBv2aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfwCWSvfyqA0hqUGDtI66lt1sskBrF45TrawCdMJTxJoeRdhCH
	Tyc2rvcA6HdgfLnX1ue/H2MmZ3X3oFODFqzLS5a2XDzo30pwF+X8QkaSSPZ0yL8A
X-Gm-Gg: AZuq6aKFqHZWAtBc6nK540yQJQez0LSGIfWFUyZbiw6hRIgP2TkrBpWtWmuoc+LZDKb
	WZ63ozYvwfIAF34l3ZL/KzKsts16vTOLCZ/YBeFrJ4apeUBokVX5icnuN1xlkUrh+HSiW7U2WAe
	/3QvMOfypTug7C+dZbvhHkttkE7NWNtTqi8pnKOF3a8nCUnU5zRGR0BRW8IW0EsyZ+bAGeO2qMM
	ZWLGoNI9h5nZUeKQl9Ae6cs4zbj9wJXyxECi764G1U2awtlaLVCkPXxWoVfuH5eCm2qAtDS2P82
	dc/Ylec2WqsDXrBy2cqF0ha9HSIE4zZVvuTsnFyOZVN+SoW5cI24a6auDAR8FKF1+n3gGjJ57zX
	OEg5LanEnlKnwMuL6J8O8+s8Kuk6rVoEjUunENXPY4MFnfLc7qciiIvd0/rKBX6nmSIaryLNRln
	hMlETYzLUkVjzRvL/bq9ydyO65+FfWrprSloOp2Q==
X-Received: by 2002:a05:600c:8b26:b0:480:426e:9d38 with SMTP id 5b1f17b1804b1-482db4e5cb1mr139231635e9.27.1770028555828;
        Mon, 02 Feb 2026 02:35:55 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482da6bcad7sm123911645e9.0.2026.02.02.02.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:35:55 -0800 (PST)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	bogdanelsandu2011@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: Re: [PATCH] Cleanup ipu3 driver
Date: Mon,  2 Feb 2026 12:34:29 +0200
Message-ID: <20260202103450.13839-2-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2026020258-very-numbly-b36b@gregkh>
References: <2026020258-very-numbly-b36b@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,vger.kernel.org,lists.linux.dev,kernel.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51997-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bogdanelsandu2011@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	SINGLE_SHORT_PART(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 29D2ACB165
X-Rspamd-Action: no action

Apologies, it is my first time using mail lists.

