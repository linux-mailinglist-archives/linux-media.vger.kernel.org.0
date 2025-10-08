Return-Path: <linux-media+bounces-43980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAF0BC62DE
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BDC23A1E7A
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6D626A0C7;
	Wed,  8 Oct 2025 17:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="MLV+20+w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA372905
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945841; cv=none; b=WeytmRk0vAdQRB/jRUB5MtV9g0C2TVvtGigp8Qcmjm1qHIJz8rGFutOBNtjMUiFILsg35FMg+YhyF8FrlfSSspNik+MHQWBA7avMRjzWABsyhbqnUN43EzN8zdXMR/QIWSArzYpgI6J1Nm1y6J10VNsxCcgWiyMNLq93P4wCZx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945841; c=relaxed/simple;
	bh=ta1HA85w2K/o1HGvXWAM9+/IhcjZhzmQno4Y2Uxu/Gg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kXcPwaevlDkpBuPeDNCxHOA99OTXIL3vVWD9aH2g6USzRugAzNFqRADsiaHOYJ8vRkURKoL+hJB6dKeawVusyapp5wNC9vOFNJGUIhc+Fpt/zkwn407pH/L0a6RU8Zy97KfAMgS2rwsCizw+NeqEXs3vmwvwLZFaH1VD8rZCYgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=MLV+20+w; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e6c8bc46eso758815e9.3
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 10:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1759945837; x=1760550637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ta1HA85w2K/o1HGvXWAM9+/IhcjZhzmQno4Y2Uxu/Gg=;
        b=MLV+20+wQK6sMjDxdW53fsuiTfNUT9xKAJXaNocb3mho8jxnMxEKGspuOxu0K/GkmJ
         d6se/RXBq3Ailv8trIIqCRBaTE7SpBLJXyehf2BJ0fwfu+7NT6LRwAFl4T4ysc/tV5Cl
         4Fc2AAICKmmg93K87zbsfWeDQQ6nG1BjFzod3mo26Hby76K+lRQfFoFBSkONPjHWjq//
         qnhqEXHEFMV3lafCMpmCm21KXtplkCM6hQDrjlDifAyq5YLffaHGrXIYoNAVHlg8fizj
         wpQKRqI7cJYW+jtkNbRlqbrhhXLwZF1EYaLYuJ8dKtupO88OT/6vCElk8hxRaQ2rxpDR
         SkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759945837; x=1760550637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ta1HA85w2K/o1HGvXWAM9+/IhcjZhzmQno4Y2Uxu/Gg=;
        b=hVBJ9zdMGabcxstNuamsByyo4Tq63/cxAx0foKbisUb5hF4cae3BEk8lYjaZYTl2Ll
         MJKpl7iH57G9gYoCD9dPNcWyYW9yzb+x7SBIro42HHGrBq7psj5OofPWRmX5AHH/YGx7
         dRI30KOGcFUChcoSVi0Xm44ikvK+ITei2CW+kGCY+ukSyMf/AwEtrsjM26Zxb7qM+JBc
         pslCQ17LcyTz2O+YKfH2ciObBqwJjOXUl6Ji70U4JAFn1lYcaj/i4lC6sXh8unEuM6T5
         KBeRXXC+7cF6QIVaG9/KYd2IJm868o3i1k5asOCSZ1pgdjFFL/6cNHYdjWhuU2Wey4r7
         8kuA==
X-Forwarded-Encrypted: i=1; AJvYcCUwtkWRdrRGVzfgJghl/yGGxIY28oh6oXLIxrnQDHyYhtG7V2qhN2CDdoPa2vMK7euKOrpKbn2VQLbQ1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDDu6rDEZmX1hzsMWaBHwETwBAAeSDYRcU5RKskUKpNG1idQPg
	Knfjwp4pua8FdptnTkRRqlWur9AxczETiKHclNuTLxNvTngcBT7JaAE26aCgEwoiwtM=
X-Gm-Gg: ASbGnctiI+4W0AEN9DonLb3sbASlBzdiPckvwwu7HWb8evyFi91F0Hp9CqNis2b1uJ3
	VhKfLliIf5YJ8WmdZ6qi4jgmuhpZCJDsE3oPGZlRCIlT0ITDzE97hWldydB/r142zbdOyaCXR8d
	5r5x1z7m9ldcwllqYP2KvJp/VOqNBDH6yJOEfHdWKPxgNW6rAiG5KtDrq/yST0ruoBTn5GE8JXS
	d5zGxi799sxnSHXldn8DkGyrJoFfv30QhFhLp452Wn4l1DfHpgBD464BCh7DaEo/AfXEQ1gudTn
	411p+0hJJfTcxZMkuyD287JySy6AC3uGaMqg0jksBE9fLlYSW/HK/XGG62t2CF0NQiO99atQIhU
	/6h9X4pr7RErpQqaKI83bqLk5psC+fDLSpuqdxM5yLTxuRPdUTM7W/mSsJunzU+PCww==
X-Google-Smtp-Source: AGHT+IESXSVxrF30Y1nc15WrKsGt0IGzfLOtD1UjZNMDB6QG0IIRSF7dJN0kGxrQHbIW3QPqLup/3g==
X-Received: by 2002:a05:600c:1d18:b0:45f:2869:c3b2 with SMTP id 5b1f17b1804b1-46fa9b1834dmr31842995e9.33.1759945837418;
        Wed, 08 Oct 2025 10:50:37 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:34ff:86e3:b660:6d50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9703sm31304812f8f.30.2025.10.08.10.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 10:50:37 -0700 (PDT)
From: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
To: conor@kernel.org
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
Subject: Re: [PATCH v6 1/2] dt-bindings: Pinefeat cef168 lens control board
Date: Wed,  8 Oct 2025 18:50:36 +0100
Message-Id: <20251008175036.8314-1-asmirnou@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007-obscure-thrower-1afcdb23c4b8@spud>
References: <20251007-obscure-thrower-1afcdb23c4b8@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 7 Oct 2025 21:47:29 +0100, Conor Dooley wrote:

> I acked v5, any reason for not applying it?
> https://lore.kernel.org/all/20251007-geologic-epidemic-2f667f232cf6@spud/#t

Yes, the dt-bindings patch can be applied.
The v6 series does not change anything in the dt-bindings patch - only
another patch in the series was updated, so v6 was sent.

Apologies - I wasn't aware that an acked patch could be omitted from
the new revision.

