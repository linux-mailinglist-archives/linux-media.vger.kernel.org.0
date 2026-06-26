Return-Path: <linux-media+bounces-65762-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YFRfHqOrPmoTKAkAu9opvQ
	(envelope-from <linux-media+bounces-65762-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:41:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E206D6CF2FE
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:41:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=LcczOgCy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65762-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65762-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 154453054CE6
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379523FD956;
	Fri, 26 Jun 2026 16:40:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281193839BD
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 16:40:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782492048; cv=none; b=Ytj5kRsMcG1zmkhTNVsf0NePqwL4xFhWSkxh1jdujE79L6LvkLGfPfOIV+p5tLT05SceN1okOGQhuPeVx0vLa7yENPRMv0qh1mWtNjnSC0N2MEo5TXQSPPb39tPL0lRsJyA0kjrEKs1yC/CmXcQXNxXi+gUtj+Fm1W2Wr70N9hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782492048; c=relaxed/simple;
	bh=Yt/kSWKYgEmn3lnGsotfzUJ++VUPu11YeZ/lRw5fMDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K3S+Ssjx6TsFzlxEbqTxBIMCjRNibQ1147KqDOIfrhJsnNMOYjQtgHZZ/sdq51AafZUhBw4SZQwjc9xj0O2U6joG+spP6twf+g6zK9pQ2HEvtG5AIhQumqtx383bu5qrpZCA8TS/xCt05gNfD1aXAm+Hm9fVRPtSbk4EGCvBVGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=LcczOgCy; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49241896317so6177045e9.3
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782492044; x=1783096844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OowDwQZb1xEXc+FvtEIGezBjSxjwm6qvuwW8y1ht2HM=;
        b=LcczOgCyWk1YA12AkizkWCnIqCzYTelI7yMOEJOmJTDGHDdqRVeTNNg1qmCSJezElt
         TcxPId8fOwq3/v/DtWSJUoDaSQmasomw487piBcv9HSsr4boXiNVRAxUxMlvSIKTbvln
         Ghw/BryZRJHHZQaOITME803Sib6SbJyEVOfHtTTYDHlkvI+EaW4ZHcRykyjkjla9QD1w
         NKcG1s77YMYY3pdHg1tBve0jcIsiPjFQ5LjgW4bxPC45nsR2cV86UWe8fo75OHY213xk
         f/jIuBbHbB1aP8uikDzFKjlFCi1k3yAD+5CA+ziTxFEnW845w4PI5y91YalmGuUDeFBA
         xhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782492044; x=1783096844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OowDwQZb1xEXc+FvtEIGezBjSxjwm6qvuwW8y1ht2HM=;
        b=HCQNJWknq/XWnQPbOuQGDJ3eCHiKK8MBI5/I4VUipgqDj//dCnq8kY4jCBGb1cZX37
         ViaYwFVfF/ZqCzgOR75ZmgGdCLdkfbDs2O45L8tx5QFRHrAS3l3OqCm1DXtbVnbdCRxD
         qIFZ1JPiO/bby6XS8IFYfLNto7c0c1CzyS7ikIqtmoee2A5eKbdKcJO/0HqGACJoVBSy
         1vIjb5OdN/b9SQqGaDVy9zO8YX5bj/vne+2WckI0nxbWaYTmyevUPyAfUeZNcnEg44Tg
         qqDy2jOe8VskJxJwOxiYZtYDRcjZY3HJHuPbLENz7yY7vFBtu9PkRgPbJ0DD0ng/5uCA
         ucaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YBp3FsV/jC/iTuMri1Mll+65UxmaXcXD3eSfC2e1g5OvIL24sPQzyN7u7EaKqF4EwqObY1mfYSvJZvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD5uPBWKMAVbOpawCpcmqWHkO12bebYuZqdO2WwXZjRvCkq/Y7
	KJgEGvh7G4HCc0zp/Dw8CGEcGUS2JzvLjEc2DRJhnroKj3W4aliHyuXpefzg7BYEdyWR
X-Gm-Gg: AfdE7ckMWWBOP4MhesfGqQz2FFmZzcp+y1TT7dDExsA11bWhJd62NLvNRtEN5wmSUrv
	1es8dJuLrlBjDZgLNeTabIR4EImCeZlUiCP3LVv+gpInN9ub/20PUBm7/7PgZssq2pegndlpbyP
	RfI+SvNp/dgQyTHdYUfl/TYwLir9k0iJiFo4uDO/vYpKl1SEKqn2VTE67pPShe6246kF1iVcmy5
	BHOFRWLUz6A82eJ3fRZ6bZQvsog1UowVKP7z+oLPjJCMEd7FU32MErrhMcr0PfX97P07S6U5TSB
	md0NlzgYCPWAijUNi/FSDlE2kRwMa3dRQMmhmhmA+sLKfZq//9NIRXG8SvqF6oKMZWjw5Ey07e8
	OP803o/sn/3RsT9b9Zf05nm7oIluMC+37fa8nnumj9/wDGBF3lRacg6iBUT3jadHEqYBietlG9r
	WP0S2RQ8eY3qBVlXnOgtz8d/fgDpkFiArIAQ77TK/fWFysKFHc5M754I++/Fgii6jLJsZbVpha0
	rXn7yJo2zlrBpgqHwVIL7WTv2u7pZuMfu8=
X-Received: by 2002:a05:600c:8286:b0:492:68f5:6b30 with SMTP id 5b1f17b1804b1-49268f56bc1mr75194685e9.17.1782492044437;
        Fri, 26 Jun 2026 09:40:44 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d998esm25393443f8f.24.2026.06.26.09.40.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 09:40:44 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH 0/2] media: atomisp: validate user-supplied buffer sizes in two ioctl paths
Date: Fri, 26 Jun 2026 18:40:40 +0200
Message-ID: <cover.1782484857.git.doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-65762-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[0sec.ai];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[0sec.ai:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,0sec.ai:dkim,0sec.ai:mid,0sec.ai:url,0sec.ai:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E206D6CF2FE

Two ioctls in the AtomISP staging driver size a kernel buffer from one
user-supplied field but use a *different* user-supplied field as the
copy/store length, with no cross-check, allowing a kernel heap/ISP-memory
out-of-bounds write:

  1) atomisp_v4l2_framebuffer_to_css_frame(): frame allocated from
     width/height/format, but hmm_store() uses arg->fmt.sizeimage.
  2) atomisp_cp_dvs_6axis_config(): DVS 6-axis table allocated from the
     stream grid, but copy_from_compatible() uses the user width/height
     (both ISP2401 and ISP2400 paths).

Both add a bound check before the copy. Found by 0sec's autonomous
vulnerability analysis (https://0sec.ai); identified by static analysis,
not yet runtime-reproduced (Intel Atom ISP hardware required).


Doruk Tan Ozturk (2):
  media: atomisp: validate sizeimage against the allocated frame in
    framebuffer-to-CSS
  media: atomisp: bound DVS 6-axis table dimensions to the allocated
    config

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

-- 
2.43.0


