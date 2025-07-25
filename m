Return-Path: <linux-media+bounces-38483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7206B12389
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 20:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D883117CB08
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 18:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4030428B3E2;
	Fri, 25 Jul 2025 18:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFgOFP4G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B55324A05D
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 18:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753466855; cv=none; b=s0tym3tpqiGoESs5L0P3CkbrSKATCQWmtQjwJJyja7e2CVCNMFNnlvvO2xZ/uYpnGQQW4FleZe49dNByjYwfN/izK3LShZK9Z3jSwmZAThocya8uT4k673AiuLOPYJ81dijuw1iww718Jjjh7B/CfLcuJ+KcenRQzyiTvrZOBkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753466855; c=relaxed/simple;
	bh=mMyBH8XWCbLKY3CM1zh7K6TDls+3IaHkmuljUMmQ4cA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=QSLo2V4dZol6ijxuxiq+QJDxFIBJ2OeWcUPWzFNuMdSbvW7Pqf2eNrDVOuW72JqIu++krL7loaX5O48l4Ysuc+iL0I4RDu2ghwJX27ta1RuBhfef8JXYhLFXqJRWWPHX4Da1ZyX5LaGJnevcQDafixMzgn2H+VyPM6E3h5gBHsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFgOFP4G; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b50f357ecso22243161fa.2
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 11:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753466852; x=1754071652; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mMyBH8XWCbLKY3CM1zh7K6TDls+3IaHkmuljUMmQ4cA=;
        b=iFgOFP4GmO2zHFN63PeeEschrKDK+kmzQkYwHD3haOKd2oJi2t9LyUeAQTPL2BSfrQ
         4hIc2P9f6grkzmi3yzPwr9JGQUBg7KKr3AaRUS8wh43eD+/vCxZjPYGtJ+s8cP07n/3p
         e5arIplHM4YNzltukIkmRjz85iX8PWb7jrKURlW8wJr6coE+DgFEQx5PHNMiiGbrX0vM
         Aj5RQBnlgfDBYfmY4UGV9TJn/cpDJxhMYdwFZbgrKnahanlIjJSgf+RaxBc6uI1Qvsqb
         T7I+fc9rtyxjj992/yus3Klcvx0qeGlJKq24AxnU3qArAMn9T+5Td+8ZJMNUrOuBF9v/
         P6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753466852; x=1754071652;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mMyBH8XWCbLKY3CM1zh7K6TDls+3IaHkmuljUMmQ4cA=;
        b=hxj2HyC9vQ61SSWcpDn/eHF3AijeQSrtOz9XandJnEl1VWbDtu22TwZXnc9XLKaAqY
         30TK2wVCOMX1P36h0Fm8Hqiy5n4llvz3lMIQJ4NX92gf++i6z0Nq85Zc1Gn3/M2dohbf
         FZzZbTrj0nECafOL5EMJDPZ3wGaFVXjtaZR3lvvioxHzblbeZ4f8tGWYa1Aa8l+oxEGz
         /uEIgjaPS5TZpwk2rQA1i1801iiXHrLE+o9q36NJghz7MVA6lP7/J5kq5oP/z+Ya64gV
         1mmd+2DVXEJkHQ+GGEMLvzpLK/E4TLAx00OLY6hOsRjYfRAZnLYHkpRLjeFqnskychUi
         3GGw==
X-Gm-Message-State: AOJu0YwLRj9eaUn0fSC3zcWPacAqV7C1bpVghDK0BJGD3ydGbMOj/hGI
	uGbrJzh5QG0Awbg67yFy1WdxMCzyWExTJ+Zytw7++qdgleyUBBaxlYD3hNLbGzMSlLXUlVOapmF
	XGJqIHLdkWdWgkupI9FrOSAXAeoF449/fpa0/
X-Gm-Gg: ASbGncs25apGpoySkmez62yMwifCtxNChKIRzjOc1RMZeLg7G4mLtpj3P7EFDP1YcOs
	UMZWkkCVkMPGTIUfLiBcRV4JkFp1nJnIt8y/4rDLoHSv7CUlkHX3MLmlLla12NFmi9FV8B/xPBe
	s2oxYJaVj3rxMm8BRyrV9iWBbWwaNjVEDigu3OKz0So9nmZPh8V7KfILdbz7pSmC7O1Vh4WF5WK
	0apiH8mykESw1Wl9ZXnC6aP38iLLOIKG4A+yw==
X-Google-Smtp-Source: AGHT+IERgpQfvXIsEDYi6hVuE27Xk6aRfttoQZ6MhGPv/tzKFhUSAhvOQvp1/wdmn9B/REOgUPqO8u4vsalItYHGARU=
X-Received: by 2002:a2e:a552:0:b0:32b:488a:f519 with SMTP id
 38308e7fff4ca-331ee5fab0fmr8524141fa.6.1753466851802; Fri, 25 Jul 2025
 11:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bobby Smith <bobbyx140x@gmail.com>
Date: Fri, 25 Jul 2025 14:07:20 -0400
X-Gm-Features: Ac12FXwh_MOhiUD4CdgyOe3YsNVNOT4HczAe4rGBdk3iAfWdUYq4WA41Jn8V_7M
Message-ID: <CALp4EOq+awthKmy_Q3r-ts_hXN=AriHedODf2taCaTGr1P5Rqg@mail.gmail.com>
Subject: Unknown Card
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Im attempting to install debain-12.11.0-i386 onto a Tohsiba Qosmio
G35-AV600 and am getting the below error. It flashes for a second or 2
then the screen goes black and hangs.

This is a fresh install with no desktop environment. This laptop is
very old I can't imagine the card is unknown

/dev/sda1: recovering journal
/dev/sda1: clean, 40212/4521984 files, 794811/18067968 blocks
[17.888585] cx18-0: Unknown card: vendor/device: [14f1:5b7a]
[17.888651] cx18-0: subsystem vendor/device: [1179:0010]
[17.888713] cx18-0: Defaulting to Hauppauge HVR-1600 card
[17.888771] cx18-0: Please mail the vendor/device and subsystem
vendor/device IDS and what kind of
[ 17.888835] cx18-0: card you have to the linux-media mailinglist
(www.linuxtv .org)
17.888896] cx18-0: Prefix your subject line with [UNKNOWN CX18 CARD].
18.150139] cx18-0: Invalid EEPROM

