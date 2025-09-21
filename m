Return-Path: <linux-media+bounces-42845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C274B8E38D
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 20:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF43817C1E4
	for <lists+linux-media@lfdr.de>; Sun, 21 Sep 2025 18:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE67275B03;
	Sun, 21 Sep 2025 18:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="UpO4mQmo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E289C1EBFE0
	for <linux-media@vger.kernel.org>; Sun, 21 Sep 2025 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758480781; cv=none; b=Jzilf4eptmIS/lp2r4ixtADhirvs8k81XqOw5TodjhMIWS5+20sWOafbj0D2kKlbaqahAY4UpbGRAdVID6o5YMcdLb3/Ta9oYU4l3bALqv4V2RvtLFraeJYDMs/gG/Hm1xUqa/9HR6fVysBj5ckqjWIxan0YXEaDS8n6G2jt1Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758480781; c=relaxed/simple;
	bh=MC8psRJR3jjNg3dIH4LXX7tPa2/ymiVUB8mRNj6lCsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aOLnxtVyu/2dC63ZXeCw1D+f/hovy+LYX78C0Tr658PHzdyn2WxeOn7qNcpk3p4/uAeTbAhE/6jf3dh4EBcd6LPusqU2vpzGF5ymFIDXDVTEUI7QmATWS2mCCX5syXXLpUfz948euWIApne0+JWMezsLnl36Y8bSwlN0KHKZmOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=UpO4mQmo; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so2087618f8f.0
        for <linux-media@vger.kernel.org>; Sun, 21 Sep 2025 11:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1758480777; x=1759085577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkZms6IJlV9Kq6Bvugi++P5U8z/GfXKW3hq5MRRzeXM=;
        b=UpO4mQmo1r7rHLs6Dpn+PYFmyxtbIC0Ay2aUsszBgnLXijoG0uVD0ji+e2YHVBnrDQ
         Nm3WFyzkZNFE/LeuJNJCXFdmw+Tq7FqW59WUw3W6TtHBzXXjJs+1NxnxXqpGv2LBKIqz
         ZrB7QAZWvhvB8GTyJD//Erv4YSqS+OOU+onQmPxjHB5i92HMLszW223Vo+ndrAeOPWo4
         bWH6rxOJ2pnK113mdN9tn9janw2fyheQ0wyKXGfzPluzVAd5VxIMVpE8kCkpDc4WEFhP
         CZX+JUZBWpM7p5JRpSTLN4g49GHiEi32USDymlFqYzLJ9HC0H7iwx/3XUZwAjTQU7Zgl
         5NoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758480777; x=1759085577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkZms6IJlV9Kq6Bvugi++P5U8z/GfXKW3hq5MRRzeXM=;
        b=vcTQZbcT8bf6nskUwv1bEwZpsOEowTZ20aaCNGiHM0YpmdQxgNKS6QhRecR0lPwWSx
         +6yVlDO/rnw6IkLdizvWPmWxLzHDV+FSXhTWzLtN7V/AD8I4loDfSRraQ7h7qNLcgrdZ
         Oikc9zSdHjdc7TRWLWbpiyLwjh6AqqGP0Eqy972Htl+PBXYDvJ56FK1ZhlFzUrYDJuZT
         cL3pnGI90nL1/+Ld4ZRWkfBsjkdNRixDXHHtVcROt7kwHIo7Emy4C0K2WXAeKFvbJVid
         XpEL+UHKa2lUkeZCH3Fu1bw4Jk/2aBHGcfo+ifr1dOjTjXbeeCpGUFxoR2SVT/vHlR+c
         B0Nw==
X-Forwarded-Encrypted: i=1; AJvYcCX971ztMqh3OiVRLsvd1kcynkLzvYlypqmLyCcdXLifOcOX7gaVVRQKWVaz4Pl1NU6moZwKlllr8H4Erg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcR7dWNPj5BhGx+Irb4XgbGl8mPY6C6Rt0gOmcBUhyhWsZJM5D
	RoOfVNSD36tKAOxDjiPn6zS5tUP2PLJlrJ1NRbMSU0NWRS33ywiJHE/K7cqpw769xio=
X-Gm-Gg: ASbGnctKoPR7z21ZA674Gr1/ZBw4HeogUmaHgDx2HMCuz03zFKwW9pBPP4qTs3BA5Al
	oo3OY1zgWz/+g5YVT0zbH4fkKcS/gKC0cOZEhkBtIxMq9yZKce3k9G327mmvHAo3DQePI92hAJP
	cPbxKghxA6qlVUeF1cax2+eA98UcsQjLuh6wqkl39V9oiPtUGuRdg/EI9oGazszl9phDG5ARrzU
	6eVW2UDfM6xpcIHR9pVbNl+kOEeJg5YpE3mLUf4lFP3WYuNRvFAZlI7HAyJcNkEATO0+l/6eMub
	QWPohawXy5R2gD1sduvtQUBhkgcQZH2aS9Y+54bKbV5M+gHaRrGjhe7BJwvk4fNrgHXcHi7IRo4
	bvIBP4ewkAL20X+Boko21TRZZwl8KWV9t1vnlnKsMPo4bTU/ZdqXm
X-Google-Smtp-Source: AGHT+IFLokWFX5QQyvB31/3nPAXcA98bLt8kBvJ4UrliwgAEi7mGk/gCusbB300xH5lmm6GEt+I+gA==
X-Received: by 2002:a05:6000:603:b0:3e7:27b9:40f3 with SMTP id ffacd0b85a97d-3ee7db4c3cfmr8908411f8f.15.1758480776576;
        Sun, 21 Sep 2025 11:52:56 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:3800:f880:3b2c:b75f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3fac7463f2fsm3468131f8f.39.2025.09.21.11.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 11:52:56 -0700 (PDT)
From: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
To: krzk@kernel.org
Cc: asmirnou@pinefeat.co.uk,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v4 0/2] Pinefeat cef168 lens control board driver
Date: Sun, 21 Sep 2025 19:52:50 +0100
Message-Id: <20250921185250.7619-1-asmirnou@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <436efc30-5e54-43c4-9d68-88bc63d71231@kernel.org>
References: <436efc30-5e54-43c4-9d68-88bc63d71231@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 30 Aug 2025 15:20:30 +0200, Krzysztof Kozlowski wrote:
> > This patch series adds support for the Pinefeat adapter, which interfaces
> > Canon EF and EF-S lenses to non-Canon camera bodies. The cef168 circuit
> > control board provides an I2C interface for electronic focus and aperture
> > control. The driver integrates with the V4L2 sub-device API.
> > 
> > For more information about the product, see:
> > https://github.com/pinefeat/cef168
> > 
> > Changes in v4:
> 
> You already sent v4, so this makes a duplicate posting messing up with
> tools.
> 
> https://lore.kernel.org/all/20250824-cuddly-cryptic-porpoise-b66b4a@kuoka/
> 
> Each posting is its own version. Resending - not marked here as resend -
> would be sending the same patch.

Gentle ping.

This is still v4; the only difference was correcting the sender address.
No functional changes since v4. I'm keeping this as v4 unless you prefer a
rebase.

