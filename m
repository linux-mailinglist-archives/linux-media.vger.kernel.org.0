Return-Path: <linux-media+bounces-2406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3EC812D54
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 11:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C4131F219DD
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 10:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30113D98D;
	Thu, 14 Dec 2023 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="siQwFQbr"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3572A115
	for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 02:49:10 -0800 (PST)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4SrTcM3867z49PwQ;
	Thu, 14 Dec 2023 12:49:07 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1702550947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=oO4Xk4XFwtrlDsqjZ3o47reuCCE5WoxxVoMKRi55mpY=;
	b=siQwFQbrGRu18EqDzIGoC6gdWj7deWNsDO45+O+Sje4QFB+PA02gV07Sg4GMfbN+2BUH9S
	xeoOHC9kEXYquW+QCWfxeEUmzuWdyOtCULsWEY+WDPLAWzlfKRtKAFhD3F2wvdWXGRTiG7
	bHDKrikOiojDYcqKscquUfX/COTpxGLbY3vwXDqvkZ277vzHRc5wzXIljuZFDKedFY/N+m
	T/QqOJVQzZStQ/B3NFLJNSWB/RkbdwsYKeLn9xWVnJ+WI2jlPp1zh/Y84/ttNQpATCLovL
	PB4U6ArhVaTjIdAJomUVqhOQiiZRWkhJF8yvGIUkRMopZxvS2YAS0Pfj0O8VZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1702550947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=oO4Xk4XFwtrlDsqjZ3o47reuCCE5WoxxVoMKRi55mpY=;
	b=wM7tWFDSfz3oETD7qnrtexVBpEy1TVuTCzNu1zOcmR268n4OjPu8R5wx6wKtMLwEoQqS+P
	cw0lpvbbOS0Ze2G5l/pjJYG5uJGM8tLVilBZ2GKyRaqz28cj3o/+UFskngnTZXHbMpim0x
	3gIxzVEZtMTIUzNiexrqhjV/Za4yaE8RAj3otiL1ZYO3kl9730DtxXUW/lisyZ0Yvcj4K7
	whEXnAjfTZjvutV3hGSy+uA6mrFxjwzeVJ10hRkPO6lqG4Lh0holal9p2Gm/1EGrAUeC7O
	HnqaRCT6IqUePVM43pDyJBpBV8bKrEriI1vu3zuh2yxclPxVVQIUi+sd0Th2RQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1702550947; a=rsa-sha256;
	cv=none;
	b=ezfUrql7pcKrjGualmrb0RAS8z+d13jXlrZgu1sQwtwGSZsIoLZ6q1QkhRivzSFA1bxDG2
	awv2+rXWeELw046Qwck8Xku5nudy7I06iGvviO8L2kSw8Ezj7kj4omnPlzf9yR85BdKFJH
	MQ7Y11uGGtHu0+pX7mkWjbMInOzv4AW2Z3eRnC96svI97pzPQ0cK8N9JWd2yhOZMaAigDL
	7tE3aFRKMqQbvbCuns7q/rXluwYybCzN157oR7cNTGpr3CXfcPd0PnpXWL8/SqsAy4Aocc
	kbrvzOS1uleLEJmT4Nd7Av/cG4uxbhpHVv2iKbQ5GhCwmDRtxFlaFFLzlw2MCA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5BD64634C94;
	Thu, 14 Dec 2023 12:49:05 +0200 (EET)
Date: Thu, 14 Dec 2023 10:49:05 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: hverkuil@xs4all.nl, mchehab@kernel.org
Cc: linux-media@vger.kernel.org
Subject: New PGP key
Message-ID: <ZXrdoRb2Y3ODUDRM@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Yco0Ayw8seRdqRjO"
Content-Disposition: inline


--Yco0Ayw8seRdqRjO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi folks,

I created a new OpenPGP which I intend to use for signing tags going
forward. I've attached the key which so far has been signed by Laurent and
Tomi (as well as by my own old key).

Can the current scripts handle this or does it need manual changes?

-- 
Regards,

Sakari Ailus

--Yco0Ayw8seRdqRjO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="sailus.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
p5/4xSiMy4C3QAsTHeRvK3EK
=LX9n
-----END PGP PUBLIC KEY BLOCK-----

--Yco0Ayw8seRdqRjO--

