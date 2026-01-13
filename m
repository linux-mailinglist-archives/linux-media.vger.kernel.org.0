Return-Path: <linux-media+bounces-50567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C33D195E2
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 15:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 712DB304713B
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 14:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7FD5392B83;
	Tue, 13 Jan 2026 14:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GBh0jrz6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F7F39282A
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313587; cv=none; b=Hnh5ab1yE1cFe2w6zRMEdWkgoY6AMFa01J08M1lF+qPgfO4a/7lk/UuDAGau3bc0AI2+FT9vbDsvZfvTxfnWgFuPUfeTVTWj0JhxzctorpUFeRXNTo224uXLi7NbwnJqB6jAPqoIU3NIwEXSXiqtZvCa//XMdBOUlIVSuLX9gJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313587; c=relaxed/simple;
	bh=tfuXJ3C12aw8vjiqo9wtp8/3Lra/eqeZkxhY6aShNVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MYKn/S7qUMUFkzjAYCO8STzmazGsWhcXSfRf8teC5X1KXs+VUHZzAJ2JjKNInqOh2rB1MIN1/sIsaDIeUMh9qoqmnHHkjSdHPpqZ6klKCXCr3bcVL1FRQkj8CV0Im56uN66owzMnl4oxhI4vNcXipVme6eYfk3KvSr8aYJMHiGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GBh0jrz6; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so47464925e9.1
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 06:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768313584; x=1768918384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QAWuu14z7S2NGjLwEpyvUPRbwBL+uRlHEdKV49EVNDg=;
        b=GBh0jrz6OijWrLPku+UGX8okaN0VA0R9B1NanxBzmgp2cwkC1MH3s4Zll4L9LBhJh6
         R2TUkfotpyu5v57bRFfUJ/+YmnPkQL6GFDYR4+Wx4XURIQ4N+KFbeh8Vxme6FeErS56C
         bpQH5HpBpXYL/ye45SI7Y30QeFlWdFr2dE7W7+b89f7Kqj+sz9HwiQdUdo++LXhygYyu
         RlaykL7KurOAfWrbhqtelMp1kBySVJYafzonH7k02Lm1mbqmvf1M50CdhixuivvHgs1B
         toTbOnSQbPUNF17GB9zx6oi9YFqua9SHODwBAQ+JBe5fhF5/H+qCya7qWhRjOtYLUZWN
         EAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768313584; x=1768918384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAWuu14z7S2NGjLwEpyvUPRbwBL+uRlHEdKV49EVNDg=;
        b=eHPtMdRNMw7SKL5edRW94bc9xNCYf06ok5ymwuJOeNowVn3HwktT+KQ9wmiXsBg9O6
         /fsyIGDrOHd/KTXcI9q3KydI2HJFj7iJ7KdKS91B/ZlMS/KeRIAqUoNGoG7bEwpCz+sQ
         6l577MB6gde7ydwTdbUqDcHXA6H1+ThBjLqVTDEoFJN53VfZigmlYq7HYRwRFwGdtp+t
         IyHK4co2DhuBd+r785EiyG6IzGvDk7C1Lqud+2Tkl98Qdq1rOqv/1Oj1Q3qVH3VJd4En
         3V+Y1+cMJQ2zS10Wh46gO0pIeYoK0hWqlKmHT5NsO3YZCUOnqVG50I4+CRu0lkS5wgSb
         XlWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVosFx1TEdx0z4Li1GCXmqBFawiMSgtsOUvQ7Bn74SMpST7K6udqETtLT48QM7yH+dcjioNJzJUih8YHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3PTXf80SMbAvupgjX5yz6k5Opzik4fRPKLy3eysUPqo7KzluY
	cGM5eodWvztOH0C7e8m/CI/iVKliiPyQ+8s/qOIlZEzK8TAlInF+j6dGF0H5rartua0=
X-Gm-Gg: AY/fxX6RLG0GQfRhBNEyHp/+I1dWk0Mag7yJHimp+d9t8wfv0QpngYfjwt8ZHe76dN7
	UOcJv1iVjobyli5eoMJxevpRDE/ycVuoEgBI0Qc5uC0CLm8/HuT9cQkp96pyMun5Bw1vjKDoRwA
	3OAhnrBn2+uYLyABcy6iRnZGW0By9vTXxXfDcPwNRcGiwznm6S9G46lOxCvVqgfyGmmhqQHiI+p
	gFKTJXwcTX0oQaySYEWFMob8DfGUtcr4JfW6rxPf3CAvfa+JLRUTZBtXRJwRoyJ4m1V/nP7KUNJ
	QdSmybyg7S4Qc+3KuO9ce9IGefZW1AjVS+MKz6nBFcrYadHdiXymHhRYfYJi375r762uAbeZ653
	kDSOwiMhY7QsvQaihyfzGM8LOnIblEBwgbILhJgSDQJXdu9/U6IV5HbVfyAXCk0+JTj3k7M8YDx
	7u69WVQmJ8J5xvoADof4GPENlUTBQBel7xW6I=
X-Google-Smtp-Source: AGHT+IELU9uN4+WJKmi5kVPT27zgXyot95ErpIak6vV96gWqLV9A6GVqn8E2QpyVEvxNVzoCU7CFXA==
X-Received: by 2002:a05:600c:198e:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-47d84b2cf2dmr257871395e9.15.1768313583873;
        Tue, 13 Jan 2026 06:13:03 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47edee4cbc2sm15967355e9.4.2026.01.13.06.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:13:03 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Jerin Jacob <jerinj@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH] octeontx2-af: add WQ_PERCPU to alloc_workqueue users
Date: Tue, 13 Jan 2026 15:12:48 +0100
Message-ID: <20260113141248.203944-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The refactoring is going to alter the default behavior of
alloc_workqueue() to be unbound by default.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
must now use WQ_PERCPU. For more details see the Link tag below.

In order to keep alloc_workqueue() behavior identical, explicitly request
WQ_PERCPU.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/net/ethernet/marvell/octeontx2/af/rvu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
index 2d78e08f985f..a5cc8d5f00dd 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu.c
@@ -2534,7 +2534,7 @@ static int rvu_mbox_init(struct rvu *rvu, struct mbox_wq_info *mw,
 	}
 
 	mw->mbox_wq = alloc_workqueue("%s",
-				      WQ_HIGHPRI | WQ_MEM_RECLAIM,
+				      WQ_HIGHPRI | WQ_MEM_RECLAIM | WQ_PERCPU,
 				      num, name);
 	if (!mw->mbox_wq) {
 		err = -ENOMEM;
-- 
2.52.0


