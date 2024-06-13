Return-Path: <linux-media+bounces-13199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7369076C0
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 17:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CD7B285396
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 15:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C70B12D761;
	Thu, 13 Jun 2024 15:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0ulUC2j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FA912C468
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 15:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718292899; cv=none; b=rXQ6smT30LSd7T3jnH2cOFypXuyXP3rqZSiKbzAxcB0eIVH/iBNsCDTfRLtA4oHdISLzjOEteOqwF5kQ9PknIpnwNo3I+0skfk58HXKcb00/ZPaRdN9b++05N0gfebh6bVfTWEQImiFAknBU8GojPVDdYM3zdDZcPfk1NzbR4so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718292899; c=relaxed/simple;
	bh=EWOGAUpMpZQ4nCoT1e6q5FFfQENbyb+ypaKHK+YSFTw=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To; b=jFyzijkPQHYlhC/J9OPm52Z+UXVSKrLe7hRutn0M5S5RhPHhSf3ID3uj9LS9cKp1wTX9ocL4R2tvvzxRXoX5Fv+3u5vsRlEZBRlcBODWeoKn86G7SX9TOyuVfWt5ssDiLQpAykOkKnof0wDvYthLoy/E832yxLzvOpSptUgxQtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0ulUC2j; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42281d8cd2dso8829865e9.3
        for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 08:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718292896; x=1718897696; darn=vger.kernel.org;
        h=to:message-id:subject:date:mime-version:from
         :content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWOGAUpMpZQ4nCoT1e6q5FFfQENbyb+ypaKHK+YSFTw=;
        b=U0ulUC2jfDfyGkvO1ODdijcM/yWLVqp55Mj2zNT2+ZXFzswoztmOiecA9Ll4ZIVsej
         wIHxjHHBAugvFPxIr/TazTkq41OAl250FpXDcxIGjok2kGntOU8UR3EeROYkSAMixNL4
         vdUsh7MnsQEQH2poFZS4Qhlmb6NLsJB70eLhB2KtZOtI5UrZoEAy2De7FSAC28YWDO3n
         Kc+M+ZndHNHKFf1sgSkS0v8XytOh75uq/CbCABUOqkP0qdQDEwtlCBGdBkIo1pkpPklP
         poYZuz5bYoJHRDgOP2CN0zcP9KXeAZ/xvOe6wfxThE1PXjiCrM7sulZ5JduIfc3lJjit
         ZOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718292896; x=1718897696;
        h=to:message-id:subject:date:mime-version:from
         :content-transfer-encoding:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EWOGAUpMpZQ4nCoT1e6q5FFfQENbyb+ypaKHK+YSFTw=;
        b=MH8jkACnoOOEI1zuyElz2Imq0BU4qVvoDVLgr+Z9K7yxApEcnb8z7F3lpMxxB/gNQ4
         bAMwH5C7z5iPSn+rrlSzKIAMQ9LhIeWrA/XPpfPlTg9zc8iMVEyUK/9hgx+Vm9RUU+B0
         tHXzbdAQCPGnex+IOAQfNzl/QvEhdTlapjSGhMN5AdAjAwzaXdjmKnJnNlw+GgJ65Q2i
         iQedEps6adLrKerWwoDBO26PMhas/7oEoaJ7OrzVbHUlRKyyat+KQ++8jJHnZMuv1gz2
         m802GQ+5sfUlSOXCMBOw+uG1LvxeOz5SX725wCknOG0mDMNSxnYyoQ0BvX+7KnQG406e
         b6sw==
X-Gm-Message-State: AOJu0YwjbuOPbqHxrrht42NdbKHHgjd/xdUcC29zUo5Sv22rvLOJx8A9
	OAHr7vtTu+m8grtD8DS9poeL8ywJUl8Wq8q5jyCcA491I+oT7qGVofTIyA==
X-Google-Smtp-Source: AGHT+IF31HIE+zJ4RC7ztQoEJaCE8PHSwVbyxQvCfiwbJzM/Xn4r18GpFu7JbsflSSUhkX7LDQNu3g==
X-Received: by 2002:a05:600c:a47:b0:421:ec3b:b7f0 with SMTP id 5b1f17b1804b1-42304828b10mr1581775e9.17.1718292896041;
        Thu, 13 Jun 2024 08:34:56 -0700 (PDT)
Received: from smtpclient.apple ([83.137.6.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874e6b63sm67410515e9.39.2024.06.13.08.34.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 08:34:55 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: paulo santos <polsantos55@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Thu, 13 Jun 2024 17:34:43 +0200
Subject: E
Message-Id: <D9866224-96DD-4010-A259-BE3EA7D8FEDD@gmail.com>
To: linux-media@vger.kernel.org
X-Mailer: iPhone Mail (21F90)


Enviado do meu iPhone

