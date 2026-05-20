Return-Path: <linux-media+bounces-62197-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM3pLB8BDWporwUAu9opvQ
	(envelope-from <linux-media+bounces-62197-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 02:32:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C9558647E
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 02:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06A2C3019191
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 00:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB291E32A2;
	Wed, 20 May 2026 00:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+CAULO0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAFA1A6831
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 00:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779237086; cv=none; b=h6ugO9RhOFHo2wiDG6zKDcw5nz+53xFLqYu+fS3mEI8HTlN3VlXtKap5R8a6IOvBbFadfYsQVqn98ltcKJdq2FAWvV3FJiy/FmpC+AofaR0Uemb77QufQG4FpA1IDuCjI6s1dkmeh1IEGGKoxdrK3DsZmnXhlIJ5dvBtC+zzCF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779237086; c=relaxed/simple;
	bh=X9TTEKkyQJa6oTQ+JZkhfD0g5LD7Je7O+pGwKp6x+k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ImT9QZJcSbb+4EgtZiwJFDv2VE9BVRx3Hb1094K8wz/PWeEKVImqqZVuIxtGY/rm/iQ7Q23MwfQQhJiyQ2HzXc0sC+/qKpQqutmXpyOGp3BU7/D5lYeFtEmfMnkA3yKJN/qkjikwDhnVdlljRawGLTyi/OPmrmmvg7ib6cj3Go0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+CAULO0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2be75f658f3so2523275ad.1
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 17:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779237085; x=1779841885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9TTEKkyQJa6oTQ+JZkhfD0g5LD7Je7O+pGwKp6x+k8=;
        b=b+CAULO0gyVR211T+n1p4q4Y1zkeh/MbzA+Zkb5CmfHliPCvlf6NFFkrViw5K1Sr8I
         ZGZO7/iYEueOL4cHUTpFSypNgOh0X3StcCT/aP8jA8iVUUbQvv+vUQkKDt2anhu/0fna
         uQNVGm9Fb6iHWDTvbCoLlxhFBVi9E40Zc6xjg4b8fa2EAsuMNShge39wk1g3HMkZqf6O
         X/5rfA0ikTkshg5sDv84DwBYQfLYsFdF6rPWgmjsnFtGnPRXaeoxe9mL/TWbkraWBIvZ
         whTYqfB2Nt1S1CgbZRwkxjWL583rW3FWtw9OfAGfFtk9YxHzWrjmOGFAXDmzsg5L9Byx
         DYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779237085; x=1779841885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X9TTEKkyQJa6oTQ+JZkhfD0g5LD7Je7O+pGwKp6x+k8=;
        b=m7JyMdbKFG6itlkHk1CT7k6u8y/TItAFm5dEZfyHGs7YggZG1UElVlKhzQqJ7oBdsa
         Lr0Nmy7Pnf+PZGUeuMFUNFvAHSk0Waa6zYdHQU8+YpLR9vdcRpFKqRfALjteawk2kw3+
         MxSSRTwgCBERuTiRLbdxhMsdflf7ZRyhlgtVOWnkBAEQVTQyRQNOwEXfWkhVuC/uxmhN
         +P6wgt4gRMzyeHmuPUSf8tZqDAFTgdgte4s1DKlR3pdrwQNMpiAd/aYaOK4n0Uh7/K1R
         8wkSxTivQmgFWicwuX6nFvxH4hJADjryuyk1gkUyNK5hXlEICo0QsZ3hNJgYteHDYhiV
         lBdw==
X-Forwarded-Encrypted: i=1; AFNElJ8ZzyTz/v8i7+smvMM3NYqEmZ539X2zyoApgKPbj7AusY6XOkaC5RNt4qzwghCKbj55kQ2QVVepku9bgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJWc9ctZjCIfMHtbpJ9v7Z2cWeOBpU+S4oAu2s6Rbdqlzyfiix
	ygmkJPGWO1zil+q0qIXJSvet/4OTElCZWJWAyxoeRQpi56wK9wGhFGZv
X-Gm-Gg: Acq92OF3qNkSguCoMiEqeQ5wpqkzGCRuMoMI+TLIIdL6qVp0s1H6uZUcSlOMEdR0W/e
	UQOSTkh2K1lYoSx+ei3QDbkVRg4ZjeUTI3KWDWKPYg5trisJLunJarUzCub9iY8o40ujUU7OM7s
	srVz4eUAUVS1Zfs8MiIlZzj0fUgdC/2xHVsukz/7GQWXzIJJTQOLEEQasJDyR8XwBDiqKsLVKYl
	gYgblILV4U/5acXZM33Z73Jfm1hWm/Vn4b2DPZLFHWqRrUWLZXjDCRSWMDYKM1TgvH2gbg63XDH
	BIm+/4nI+MX9dx3bRIAbHmhBbSoA3wGzkqN72ieXI7S198kxGasf5xQ2wE7p7Mr7YIApm/DH+G/
	/09vCnBqemgJUuoybGpAuwnnjp0yU+btj9ZSZfQlJOcU+7VkR4iRrycVQiytXaAEs7iugSxsZ74
	D9PgH+vXnR9F/TcjG6kw9jCypxAx8cWgb29y7f05cirQ==
X-Received: by 2002:a17:903:2a83:b0:2bd:2458:50d4 with SMTP id d9443c01a7336-2bd7e9ea9f8mr215661635ad.41.1779237084677;
        Tue, 19 May 2026 17:31:24 -0700 (PDT)
Received: from arch.localdomain ([2405:201:8043:c04b:347:9864:7116:e114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f36fsm245556425ad.21.2026.05.19.17.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 17:31:24 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	andy@kernel.org,
	debjeetbanerjee48@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH v5 1/2] media: atomisp: csi2: Remove unimplemented DPCM decompression
Date: Wed, 20 May 2026 06:01:04 +0530
Message-ID: <20260520003104.17521-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <aeqJt8gI0I8KnMVB@kekkonen.localdomain>
References: <aeqJt8gI0I8KnMVB@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[debjeetbanerjee48@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62197-lists,linux-media=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 17C9558647E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 24 Apr 2026 00:05:59 +0300 Sakari Ailus wrote:
> I think you just remove this comment and squash the change with the 2nd
> patch.

Hi sakari,
I have squahed the commits and sent a PATCH v6 many weeks ago. Could you
please review it and send feedback if any changes are required. If the
Patch is acceptable, what is our next step?

