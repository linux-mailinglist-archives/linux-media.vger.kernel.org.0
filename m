Return-Path: <linux-media+bounces-54859-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePuUBqWBrGnjqAEAu9opvQ
	(envelope-from <linux-media+bounces-54859-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 20:51:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC9C22D5EC
	for <lists+linux-media@lfdr.de>; Sat, 07 Mar 2026 20:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A2AA3021E58
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2026 19:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E6C33438F;
	Sat,  7 Mar 2026 19:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSg2+/3Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095D22F8BD3
	for <linux-media@vger.kernel.org>; Sat,  7 Mar 2026 19:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772913013; cv=none; b=F0CRzCAC8QlkBOB8mdn3N3snY8Mfxs3f7zk0IIOxoQ3rtgFntTbLkrZhltFe4sNn8A2tXD9tEOUdgsd149Ur8SJWzNcc+0Qj2LHsCIRFQdU2OYZCO7/eCpHPk1t3fhfWJtqIu1o5G4a+3bqMiY+J6jcR32KEr17F8aitXC/2tEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772913013; c=relaxed/simple;
	bh=iEXmZffYz3xtziMINJAnHlhToYWmJa97F9m3VgiKNn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKolosH4QOfH8ve5RrUTclV9UxX0zJ+ztXTnvrNIAB93bkSt5IiRkqQANBVtywtLeC1ezoDVWR5HpT289bfYpU+Y862XlxLoArJfdHV2zuoKTvfQbcHxNGYGr8bAeJio+yX4bLeBmR/qSbDt1sh+C7z2QjwTdZjRoBXlz0ZTQF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSg2+/3Z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-485345e1013so1129775e9.1
        for <linux-media@vger.kernel.org>; Sat, 07 Mar 2026 11:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772913010; x=1773517810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VA2T4+E7Cz/MdnJxYGN4ddNdlwgpT5KVV4eEsJxg9e8=;
        b=VSg2+/3ZfIy2S8d+LsxxhbXW8kT7wqnjtInoQEezQAG2YCQkGMP7AitDOiYcdHT0ff
         cMjl5dR0I6+vYakYuRm/NS6XqSnaKQVRg1JwKTuGIDDGxMM3LLGsq6CzScGMd+gFPdoX
         QG0L0pITqZykbIyEuD2N40VIARhIgnRvJIWwSsmEtU33vfiVpHC0LHVRKojfVJiTnKZF
         YEkuCEsQ3i7bVOYVTjOFjawW9YBzm1GbWcCCMwdQgzdbH6FJ8tucwdikNWGGCMB7yj/K
         sRaEd6BLgP9xgNK6xeeIAvBXkclvQdv2H3Sl7Nc09ZuoBi+zlMdjs4H/LoJC8CstPDsb
         jH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772913010; x=1773517810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VA2T4+E7Cz/MdnJxYGN4ddNdlwgpT5KVV4eEsJxg9e8=;
        b=dnad1nLy5lBoRd8bI4wA8jS5JRyPoeCtZJbOFbcAsE1gl8R8snbFTaAZhjQ8Hd3EKb
         zEZa6E9OxLtrYjhHdb/Gd9qI5a/vYNLer3XNm2pgZITPOY056tcGl8JhhZ1sW8B71yZu
         yPuIig4YrDEXxOMIV61eatjAi/kYxXb0tqr63hKUUykQv7szHHy4dKASjRe6UjkqqHGe
         FQQK7FyPpdEnpzB8UhkEMwBnU1OgbUUSyLpwH1CRXyCV37Ig2FRPtom4NRf8LCo1t3xg
         WgKqhKfSshxK8Hkc9o661Kpgeofg5fXRG3oHswfZNP0I6eLHbKnsSzwggqAILovEp3bz
         y5LQ==
X-Gm-Message-State: AOJu0YzbLML+jPyeJB5GCcjeL5gzS3ica6XFKoUNA9IAsyhH/16tyDMf
	TL/TUL0d9upLH2i4NrpbZVg3I91RfrG/9JKBJPxVTo7gy5q0On8kkTU+LwBudQ==
X-Gm-Gg: ATEYQzwGGQLKbe6hA47t/WNMfZ712YFcxaqfCCWdQ1tD22g5uu8jsMNgRiR3GPsSmwm
	NZkgdMROTCKbiDGNl7vypyck2HpWOcZenNhCWZedML81Mja1tXqZMQ6aiMWtDKd3YugtuW0T+Gy
	APci5szGkwlr+O7/XGFSb3SZUNQtJiQsvPCE7Kd+tx3wyruNeeF5Rf5yQK1T9t5ZYlw51sl3U6J
	FklyfkOUm9jsVI5IqskxJLm9QA7Ef2SVy7yVA6sIiW28GRG9usfhWErAgxRt81PKmoRChSIBYtK
	tCWHTc1BXyjpTqgoTyIJWeZaLCB7t07FqdOdQSqH3sxFzxwfQ6BVzK9BPkJdWG7aRNUqC9efe2N
	E4lYLsRmluBohKBSsOU9Nsxjll6BL0hgbJMQzSyPYf6SC035oP7KhthV54Sbv75GhJ5Y+z0fRNZ
	kVBoF9I/mXJraalftAR3QxBhFkkhnQSpHMvyBMgkES
X-Received: by 2002:a05:600c:8b6f:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-4852674e8f7mr109354075e9.11.1772913010175;
        Sat, 07 Mar 2026 11:50:10 -0800 (PST)
Received: from localhost.localdomain ([102.164.100.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm288980035e9.4.2026.03.07.11.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 11:50:09 -0800 (PST)
From: David Dull <monderasdor@gmail.com>
To: jai.luthra@ideasonboard.com
Cc: linux-media@vger.kernel.org,
	David Dull <monderasdor@gmail.com>
Subject: Re: [PATCH v2 06/10] media: Replace void * with video_device_state * in all driver ioctl implementations
Date: Sat,  7 Mar 2026 21:49:52 +0200
Message-ID: <20260307194952.1866-1-monderasdor@gmail.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250919-vdev-state-v2-6-b2c42426965c@ideasonboard.com>
References: <20250919-vdev-state-v2-6-b2c42426965c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6DC9C22D5EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54859-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monderasdor@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.990];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Jai,=0D
=0D
This patch is too large to be reasonably reviewable in its current form.=0D
=0D
The stated change is conceptually simple: replace the opaque `void *priv`=0D
argument with `struct video_device_state *state` in V4L2 ioctl=0D
implementations. However, this single patch touches hundreds of files=0D
across drivers, helpers, framework code, staging code, and public=0D
headers. That makes it extremely difficult to validate correctness,=0D
spot exceptions, and reason about regressions from mailing list review=0D
alone.=0D
=0D
A few issues stand out:=0D
=0D
1. Patch granularity=0D
=0D
   This should not be one monolithic patch. At minimum it should be=0D
   split into:=0D
=0D
   - core/framework changes=0D
   - helper conversions=0D
   - driver conversions by subsystem or directory class=0D
   - staging/test-driver conversions separately=0D
=0D
   Right now the size alone makes meaningful review and bisection much=0D
   worse than it needs to be.=0D
=0D
2. Mechanical conversion claim vs. manual exceptions=0D
=0D
   The changelog says most changes were automated with Coccinelle,=0D
   while function signature updates in headers and edge cases were=0D
   handled manually. That is exactly why this needs splitting.=0D
   Mechanical treewide conversions are one thing; manual edge-case=0D
   handling is where subtle semantic mistakes tend to hide.=0D
=0D
3. API conversion proof is missing=0D
=0D
   If this is primarily a scripted transformation, the review should=0D
   center on the semantic patch and on proving there are no remaining=0D
   mismatches.=0D
=0D
   Please include:=0D
=0D
   - the Coccinelle script as a separate patch or in the cover letter=0D
   - a summary of what could not be converted automatically=0D
   - a treewide grep result showing there are no remaining ioctl=0D
     prototypes using `void *priv` where=0D
     `struct video_device_state *state` is now required=0D
=0D
4. Conversion consistency=0D
=0D
   Several call sites now rename the parameter to `state` but continue=0D
   to use it only as a positional placeholder, which is fine=0D
   mechanically, but the patch should avoid mixing semantic conversion=0D
   with opportunistic cleanup. Formatting-only churn and spacing=0D
   adjustments should be kept to the minimum necessary for the=0D
   signature change.=0D
=0D
5. Risk concentration=0D
=0D
   This patch touches both framework headers and many driver=0D
   implementations in the same changeset. That amplifies the blast=0D
   radius of any mistake and makes it harder to tell whether a=0D
   reported regression belongs to the API change itself or to one of=0D
   the driver-side edits.=0D
=0D
6. Reviewability for maintainers=0D
=0D
   The CC list spans a large number of maintainers and mailing lists.=0D
   That is appropriate for notification, but not a substitute for=0D
   reviewable patch structure. Individual maintainers should not have=0D
   to sift through a large treewide refactor to find the parts that=0D
   affect their drivers.=0D
=0D
Please respin this as a structured series with the mechanical=0D
transformation isolated from the framework changes and with a clear=0D
accounting of manual fixups and exceptions.=0D
=0D
As it stands, I do not think this patch is reviewable in one piece.=0D
=0D
Acked By : David Dull=

