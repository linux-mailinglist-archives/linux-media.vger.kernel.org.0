Return-Path: <linux-media+bounces-51992-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIGpK857gGnE8wIAu9opvQ
	(envelope-from <linux-media+bounces-51992-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:26:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACE5CADE9
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63B1E300EFBD
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8971B3587DF;
	Mon,  2 Feb 2026 10:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMt4KqZB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97A233A029
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027657; cv=none; b=KzOFkQGKKwYvMfxcD5wkKzrrvYE8fRFMJZk9wm/JpZshfciJGM7erL698PUuAObWnIRgTSTDnc/X4o3A9QvH0K8Z4Jwm0SyoUv7/WFGzyRq7mHzhQvLywtWYu/YDuJdbB4Jd3BvfzQpWrCOk5+B7bjyQhX+8LzdgjWG1zBNywio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027657; c=relaxed/simple;
	bh=P28NzH27kIdaY2ZDMiZikFB8zGCaGJoO0r/MsDtlXXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lBamplFMwcrCc+Jrc8iObZrsqlFtc8PjDDWvnyWMyr1wINot5n3vPRipA0DpD0TTPB7eS/3OYSKMdSbfWMnvx4buZNr5c1La1teHyobGx/gZ0jRATuTHosMVw5vR8yfYcEHE9C8Zs1J11eEGInNjy6Y8qSJTVk94M53t/8ZXwok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMt4KqZB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43601e96f72so767941f8f.2
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 02:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770027654; x=1770632454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P28NzH27kIdaY2ZDMiZikFB8zGCaGJoO0r/MsDtlXXc=;
        b=eMt4KqZBEAR6E+8iLP5AGIyvYdg1y3qa9OVg9Igdtf5KWgqvY1VImHRRADcZ74LRnP
         0jen/yNNWzquTbiRfGIJAXICFt1rH4f6sl5un7y5mRZMEi2rr9vJpjMh7praVG6hX5EB
         5aj5BtoAsK2ZzuVBmR1jARORAb1m8MAMuaYP92mhdEeXuW5SxnR8ShghrCxCD2OscUl9
         pzK9y91i/fJY3558hdTw/GbuZyz4NHjPZS4k1KvN11/kG0rABffn9SCmdaxRo1qLrBvB
         a2ltBAIhfYLuxAB+syfO4EbRwGU1c8jZzohMwCBzglYq3BFSt+0fhlALFRZI7gtu8rOG
         b3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027654; x=1770632454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P28NzH27kIdaY2ZDMiZikFB8zGCaGJoO0r/MsDtlXXc=;
        b=r/TJtsNgEi5zsSHXwRJHjWbBI6Tm+QLZcP/9b9Nhlo3Dpm52VFs5eFZOkSM27PJbOK
         610TuGRJ+2nkOW/KDdxlJbo26XeYelKxSUxo7QPisEBBMFhl8ylMR7Dz2DMhrLlDLQZ8
         JVAJTYmtOFvjXDTMfVjU3sOkCP7U9gYTEJLRffZKBCDE1bTdRBwOvOKos/ywvcRgRbMF
         LPqphYjaJ0hRDPZn/uGZ7lNK7Id/5AtMxFB/Wo+pCExQ43PcDGgsaHk0fIUXviu1R6Nf
         gg2jaQPiWTgwHkgTm41s6QZ/Nxfu6xxNfsYx2ym7l6bI/jBBzNUc9KLRWYiTihFYzb2W
         a7jQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7dFCRuXxM359ocbf+/vViX6JOa0XzZv25aiq5FuRGSaLtsw7Ezw21sOwxFj+FLPxoyxVzhfpqBdFg7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSTNpfeDkfGIiPJoLU0xo0A9FiMm3zn2Y4rC8ukgCDlhJp66bH
	RpzMfWKvHQawy/lRaxg8WmjztrentoOHLi8tl4wo7Es3W2ec682EL8+b
X-Gm-Gg: AZuq6aL+BcLI32A+Ud6ZA1JmaXDE6LiJUjgjBTUHTv7T51Yl9AkYPfMP7Nu/RAGoljA
	51CtMYhprvBHiMSyxqrR7omXL9gsms4f+PjCwNcMVH8BwbReDVkps3Jim9bkiHfOY9j3l5rExHA
	LQMKr8yzRbRl+SGwsLHNG6umb0xKYQNHoie87CYq8UXGodh+AYHyiMPgzF23N8pQAylXEpEyyMY
	ZBXXmY9UsquCWYIhCTHaKDq3IJjekYj3Lbz1ijXpz9ZCTrMCfiKv2xinXdZbAFePFKQSaWcm10c
	wjjBlfHhuZNj+R+yTEFV3AHt8ZyDa9Od9DHqE0qkZHeJcEXwin30OHxYErLgMniTJ/oZ6AG4sfg
	HfLFKT4zS9GY+EJh0BOtZAK9KQdI66indneWZUVhZBYtoWzygZcD3+YLRVr6SEFFZAt+FOsPOej
	yQL2+FmcvWnVA5OUgvhkGN6MGFXe+Xs9xTdVrFT6xgE1uDyHOG
X-Received: by 2002:a5d:5885:0:b0:431:808:2d58 with SMTP id ffacd0b85a97d-435f3aadb41mr16590973f8f.51.1770027654151;
        Mon, 02 Feb 2026 02:20:54 -0800 (PST)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.81.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm44667193f8f.26.2026.02.02.02.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:20:53 -0800 (PST)
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
Subject: [RE:PATCH] Cleanup ipu3 driver
Date: Mon,  2 Feb 2026 12:18:43 +0200
Message-ID: <20260202102033.9642-2-bogdanelsandu2011@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-51992-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,vger.kernel.org,lists.linux.dev,kernel.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bogdanelsandu2011@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2ACE5CADE9
X-Rspamd-Action: no action


> Was this an AI generated patch?

I can assure you, it is not AI-generated.

> Either way, it needs to be properly broken up into "one logical change
per patch" like all others.

Understood. I'll resend it afterwards.

Thank you for your patience.

