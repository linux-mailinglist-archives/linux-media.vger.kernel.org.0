Return-Path: <linux-media+bounces-62147-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Hz0DzJoDGpXggUAu9opvQ
	(envelope-from <linux-media+bounces-62147-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:40:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9933557FD9D
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 067DF3012270
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 13:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E05348C60;
	Tue, 19 May 2026 13:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itsmFwvN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B26E40962C
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 13:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197547; cv=none; b=usSJmtFxCj2AuAUbiCeWLZsGmfOXjV3c36vw0Kna7b+bAS1zkuHChi4qrks9hsTjHnAdaQFXaQIOIRrCLoU0IYrk5IJvsOat8Hy5vxsC6UAuEXwUMf95+V7zteygF3AiT+RuHm/WTka2uivh1GiS7cLuPnGsliIIz5XGoEEJGcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197547; c=relaxed/simple;
	bh=dYwTqjisT/JoCsQFOnO9wxEbMwHsh/acug5RdGnsVRQ=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To; b=qkKGOsuhHWCjZ/oMNrwMMVJ3UFiTbBWQv5bzHE+5e/hGEy6p73LeVvlsnTvtfIgZ0NRYLL422+2B8S0VkK9QByXDqeH7aaDFNA8luDcmYQovazM/cTjTv+Ywsi/BGyfTnuM/dIqXKab66baiqlTRnYVwAnShdPFjZ2M49z/GtUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itsmFwvN; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-95cd8b71105so2062223241.1
        for <linux-media@vger.kernel.org>; Tue, 19 May 2026 06:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779197545; x=1779802345; darn=vger.kernel.org;
        h=to:message-id:subject:date:mime-version:from
         :content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYwTqjisT/JoCsQFOnO9wxEbMwHsh/acug5RdGnsVRQ=;
        b=itsmFwvNlVdQC5/3OCLJ7GQzsw7wJ/h/7eB9CEioQzfmRlA0by6uGorPeEH7/PeN7n
         Wv3tQeYB08Ic8xuh3/dQMQp9OZcBRZNFLBWGFuIOHR/FAa/OhT1byg/eWo5XQ1hM9qt3
         6WQJYWsdOq8RJ0uvsyWKz7kBdMBPtG+wFvGNvlRhD1ljoHGEVBmblmTgA9x01ipCHCwj
         OprQ3CPY63UA3qns3X+46gM8CPHNKWnqE+Kt0koQWnGCS5drF1dMLoKclsV/KatSzyH2
         wenixJvuQyNNnk6EDdtBFcxmpwxKmWy8ArCgP+oaPQ7eNBY/bqmazECtiuZBxhvcAwy6
         FaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197545; x=1779802345;
        h=to:message-id:subject:date:mime-version:from
         :content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYwTqjisT/JoCsQFOnO9wxEbMwHsh/acug5RdGnsVRQ=;
        b=kFZnNi2mVw+4aQ33yo0ObIHqAarJ+vktrLCmH+FxCCF9IdlolNJygD4/4AOAyNEaXT
         /bzPsaoCDe2TR51vW5jic0U/MrIt/RYjl0DN0AOaRqyiQlpokZCtrj+XwfnGJCH6Puuy
         bGccK7guMTDaxUceHZHVVy+va8XWiQo9K9kspJmx2mtnqjJF9Z8XyVst+wDCM1LbGly9
         qWNT104uQZBxGn3hEhV6v0d4qV0ppg9+W1LcmV6my+RM+mii0Lb6Y1PGlS56W7RYi37q
         PBOpSnupglPDa9O/tMk19lXA0xiD41bRIddaWkAB8cI+lFXbrrP8sudojV53eWHmHiTr
         hH1A==
X-Gm-Message-State: AOJu0YzDU3rY907kQ6+zdmUEA8F5R0Q+shl17A0pDkINrN2/tnCU2ZBG
	H06+f9843W9O3N/HfNT6bkAW7bpQe4HZ0ZxUEe+rL49qTQ472kwegCEzg1tirQ==
X-Gm-Gg: Acq92OHpSUo2saWyTrpxPtC/msh1ntU38hWMtHSFVWsExWLIufoUq9BXrdSTqOFzcbu
	9MQkNNieTqScINTziqNaLOIQxPdv+S4hO7U7xOxyNeuV7UepcfgRuqgj00QDWDTabIvQc+2ht8/
	eK8pHRfylVBHnE+wuLFOeCfnYT/KRIvJFTcKnTJ8x0i9Kzrq/HXHkRBd0G0fwOri5dKcuoH1ohA
	AQ+OmbzfqTZaK8hjOVnimrxeZSPcu1n1AyO/uIh2/X5+Wumf+6b4sDsHNaQ/i+nhR8mZ7u5kzKp
	2IqfZ4KrpVwdK6XsTBkz5fh5UGw4RvUijGsETxKBfJ8J47RfSb4LrSKmQyhy5/rJru/m5UHqi/W
	4utlkPuYuPTbkIgR8F0bi1z2XgCP7tOM43fPPKGoXmNEU1yx/rX+lOdBNRQQ/HDn6psWFy6qyVM
	+M5FZ9BzUnQEQqFRzBJ6Pwm61/lHMnc9JdbDueBY0gUseB7zVz9eIuwL1Psg==
X-Received: by 2002:a05:6102:511f:b0:631:4e25:5e40 with SMTP id ada2fe7eead31-63a3f698d43mr9370085137.25.1779197545059;
        Tue, 19 May 2026 06:32:25 -0700 (PDT)
Received: from smtpclient.apple ([2804:389:a29c:475c:bd2b:8a57:ef2a:d8c0])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63ccf18e114sm6185178137.1.2026.05.19.06.32.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:32:24 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Guilherme Vinicius <guilherme1a7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Tue, 19 May 2026 10:32:08 -0300
Subject: C..
Message-Id: <9E197916-ABE5-4D22-B259-DDA09E400272@gmail.com>
To: linux-media@vger.kernel.org
X-Mailer: iPhone Mail (23D8133)
X-Spamd-Result: default: False [-1.93 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	SUBJ_ALL_CAPS(0.23)[3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62147-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	APPLE_IOS_MAILER_COMMON(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guilherme1a7@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SINGLE_SHORT_PART(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9933557FD9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Enviado do meu iPhone da; dadyu

