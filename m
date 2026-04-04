Return-Path: <linux-media+bounces-58049-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TNiDCDSG0Glz8gYAu9opvQ
	(envelope-from <linux-media+bounces-58049-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 05:32:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CADD399C02
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 05:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA21E30074FC
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2026 03:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B00932D438;
	Sat,  4 Apr 2026 03:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nb/Kuj2y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBD323EA8B
	for <linux-media@vger.kernel.org>; Sat,  4 Apr 2026 03:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775273509; cv=none; b=NJrP2aFODH7bNOdKPsHy2efnB6xY6+fQ03NnypAQnzEPG3k4sgjPyE+0bnjYAtM0pmn90RuyBOhwOPzxG6btXq1Azkx/iHBekXlJ1EDzEP7OMfVFJ446AsJ0k+n1LVS4gh/HbmFEtMoHQL2SrXU2HbdqpoJ2NO5xRejLHiFBqbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775273509; c=relaxed/simple;
	bh=myvzOKJS1/6TEZHDz+FEt5uniMoDvWvsRV444R4b1j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSRxBqbUL7td4nl0p6jxQxaKRLA8Bq1U7w8mGn15HtbyoG2QqEuXrjSvnfqkj5AIM53bx/fBYYR81t4RkzryOf2Rn9iihXQtDzYv3PyuUydalrkTRS0xPylphdQfJDfpXCJZ4xOj85N9uRldj8fA1ICsiZ1CUdOxS0bWzZb9Feo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nb/Kuj2y; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-464bba3a9easo1427767b6e.0
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 20:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775273507; x=1775878307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EX07zznhycTuQQH6RFzBjYERCchLRChoAhRkTbUlVg0=;
        b=nb/Kuj2yCWkT74txP7r85wmHhJWBMiPmEvkIh3WfF0TQytQu5QdHhn8sZlouiNEQbD
         KFi6Ou7fzr5BU7kTgxzDrEiazNSBneednr8m4WpmCsb9JnJscQMxyyC7J8JxkdbtByEB
         hsKkWzw5wBHFUd4dB+nd0AKqJ3p5NKWgX61gXsjPwrOB/cWFZwrj2un0AfvqQtXw52dL
         MNpH2yFFLIQkd2DtsksjEMoM1YH1agGnUSnVRjXkuFiXU++pccR6Lm23Re5R6pdslBIn
         579vh1kffRyJxJNSDPlQR6la3HWXVujE89hjApec3qy26CGmLrWLvC1kg43v9AyWsGca
         7J+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775273507; x=1775878307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EX07zznhycTuQQH6RFzBjYERCchLRChoAhRkTbUlVg0=;
        b=tN//gPSmeCeSMtUnjdlbPbBOSodjWi7pu70asWG++5X9UD/A938x2C4sg7BhxMa1Aa
         o8IX05S7ZKESvUsusZidzLfXOCHRX9PQXPjEls1G16/bQMkmELHmdc79f43/jmHm/5GN
         jM4NbPmNtZsCYuFyyRTabavm5QwLNFRjFnIGZBsnEFuUZFkeyc4g4+ShPAdLu4mCNudd
         vq3T+Q2+BrCNvCK8DEc02VVcX0wx8NY7EdKjyC+9vieHHbScjyowud7OVrCieq6bN/LH
         GKtZDWE6O1SLwsHio/TrNKJETe8MKz5QUH/FeU4kgu0+KNsYjZuvtDA3sRJGFLm3M4sA
         3B8w==
X-Forwarded-Encrypted: i=1; AJvYcCVbnQ1ZX79hyDYUja5xvJ0yYFB8pV6xln/Zoozs5jAzWWuqr5tLNb6mO3acMBJIkotQqIqKc7LS6pAbQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNR3ALfntMSihkgZmX6Om2ehMMdQ6XgvS7FOITg2dfUTwQwALY
	m8tEtELuecKtTEA6KAMeTtuLEU5NzKnqCk1hybU+gik/vVQA3woN8RDg
X-Gm-Gg: ATEYQzzuRHDDeiQS1ogHiY6ugU0wBFMKszv2m7XLKfQJtKzFWuU9MIzDb8djW2EPYW8
	hYcYB3UQxf4jgcBFzaxm8Y4UcskdfzHkjsTJkdA7U0p/QJRXP8FH8BqBtP5JyADe3caBWXpkT1t
	CG17/l3UwpGAQsG7a1GaXGmnOpo/O/Y46PNfWPnoJiThgqdkPCENpRZotjDVAoiJiBsSf7Kym4m
	Yoo8duvrC4Acbqj/xe0jJm3fECAHp+R7NnyomARCEvyP1aWN3rx+EyQ5FLTFWQw7whj/7DSd0Vb
	/JOBP9xB1EiU5eaA/JGymFWdjdVE72WaMavG16FoZ5Dq04Qipu0s5vegpl7MbqiOW2s3VnbDd9R
	p1afIBD+PG4z2Ud84sSXuGXpTnA/nxRIy+Vmh2MEYOzKu/egOVVS4rTsXU8BhsIHHfQp+/eYbJg
	iILNWw0duZye8QIsHc7zvPG3eZMEWOi8qVOTMah/T7g9uTkbmrIryrda1r9RNn5ye1d+Iy8Ew=
X-Received: by 2002:a05:6808:320f:b0:460:f435:2a70 with SMTP id 5614622812f47-46ef8845559mr3005591b6e.47.1775273507365;
        Fri, 03 Apr 2026 20:31:47 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46d90447177sm4485675b6e.7.2026.04.03.20.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 20:31:46 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	andersson@kernel.org,
	bod@kernel.org,
	bryan.odonoghue@linaro.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	dikshita.agarwal@oss.qualcomm.com,
	johan+linaro@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	stanimir.varbanov@linaro.org,
	threeway@gmail.com,
	vikash.garodia@oss.qualcomm.com
Subject: Re: media: iris: enable SM8350 and SC8280XP support
Date: Fri,  3 Apr 2026 22:31:45 -0500
Message-ID: <20260404033145.10625-1-threeway@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAO9ioeUjYrR6fWSxm2DP-AhEMa8ZxSKE5CfQq=s9BhAqWA-5=A@mail.gmail.com>
References: <CAO9ioeUjYrR6fWSxm2DP-AhEMa8ZxSKE5CfQq=s9BhAqWA-5=A@mail.gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,linaro.org,ixit.cz,vger.kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58049-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[threeway@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4CADD399C02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan, Dmitry, Vikash,

> > > But these logs don't capture, which buffers are causing the IOMMU error.
> >
> > I'd be interested to see if we can run this test on venus - instead of iris.

> At least when I tried testing it, venus wouldn't even boot the
> firmware on SC8280XP, citing UC_REGION error:

> 2026-04-03T01:51:05.376407+03:00 rohan kernel: qcom-venus
> aa00000.video-codec: non legacy binding
> 2026-04-03T01:51:05.437232+03:00 rohan kernel: qcom-venus
> aa00000.video-codec: invalid setting for UC_REGION
> 2026-04-03T01:51:05.437838+03:00 rohan kernel: qcom-venus
> aa00000.video-codec: failed to reset venus core
> 2026-04-03T01:51:05.437850+03:00 rohan kernel: qcom-venus
> aa00000.video-codec: probe with driver qcom-venus failed with error
> -22

The same is observed on the X13s, so venus doesn't load.

>  I think it was captured by Steev:

> > This is much better than the previous venus patchset where accessing the
> > hardware decoding would cause the machine to hard reset at least!

Indeed, the older venus patches would simply force the system to hard reset in
EL1, and in EL2 there is a fault (but the system recovers without the hard
reset.)

I do have a further question, isn't the information we need somewhere inside a
TZ managed context bank?  Can we even see in there from userspace?  I really am
out of my league here, but I'm willing to do any testing needed on the hardware
and I can use b4 with the best of them ;)

-- steev

