Return-Path: <linux-media+bounces-20201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C295D9AE53C
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 14:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 722D01F230D4
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 12:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778951D90AE;
	Thu, 24 Oct 2024 12:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/59rqLG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAA31D514A
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 12:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729773727; cv=none; b=dnaAOfjwdOyJnw9UmU8x1lNgrPWdOJh3Ms2wspzCFnOU/+QNnBeHUmPvLb6M3w80YhRi8J8UqdNrnqCEv2rM/+N/6olgx2SQAa1CzIM4CzbZ3kfW6Daoy8VI3gK9pxbuZLlCvicThmQXxDbRvvjbifbwcE2LdaMb0NiGLEnXU74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729773727; c=relaxed/simple;
	bh=y3NK5f7I3T0kVap6zRG0XmzzEF76zGfHonnvdBs/CS8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XSxRKlWBl7ylTMzVGiwQ8n3QzNhj6+000I4VyBKPgSuWgshwfZhlsb3sIu9CpNUjP9UGBvhhpyV3VZbBvJjYEvYGnW5AUnvpQtouTFGaQK6Lbgr9Ui8leNIbLjUBNd1N77Gutsf6JG2REifnBVCeKx+fpBnUbNhPiJo2Al6Jm+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/59rqLG; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a977d6cc7so50297966b.3
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 05:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729773724; x=1730378524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3NK5f7I3T0kVap6zRG0XmzzEF76zGfHonnvdBs/CS8=;
        b=X/59rqLGK6q2YwJmar+UT7Y3KvdyzhK0YFLFLS7s+EWoTGA+0wiF77gv6ZEg7GhJii
         gfwgE2+AQ9JoTahcOlQ32QH7RhO0tiwBzWzupD7X/IA4d81Q7WSNFMwiaCF8dVHXK6tx
         FCPWGckVDbowuEJOjZaRfapyq7YyLX1R0RKNLPW1hSh5JwGtt2iGHM+oqIWL54IgZ3EV
         pXvvr/8h6RPHQ3pH05yQmGGaYvlaKp1ht/kRhWtVYuquuTMt+MJJyFXOHJNoUVecvw1E
         cFWLHRcTS1QikkZQ6HjSekrgBJdPf+E+Jap1Q+IVTFViNvuFYjjqUEDkGFOaY0S18fEV
         GqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729773724; x=1730378524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3NK5f7I3T0kVap6zRG0XmzzEF76zGfHonnvdBs/CS8=;
        b=QdQqyk4aAnYH2HCAdcCISSRzya7sOSZxFpWzQR9tylsO69LjrSHpkUmIzi489RSh+K
         MkaUNK+rsMbvaS64fU2tMWZKfY/sAvxq/zIGhgjJIl4d41nMvdtzj1JKU6jjGSrm9/ow
         HMbFW7cK3X8Gf/HavMSOI51kFeUCOhGfLfgy2Z9ev3ZOFyJQmVNF77HtR81O86+PENG3
         wz1zLoJC7rIZ3iTK0eWMu8HpHHmoasZ+blJ88uXbtNPrfc+yjSun/ifdbPdFrLZllTlh
         A/04wfKIBVQ35HPtxSDuFV+0fT/1oN/0nMvO8PiE+ugyAodtr2Bix6JpiXx77uxj/vyK
         Kw2w==
X-Forwarded-Encrypted: i=1; AJvYcCVOTDNCF7G/QvKj8oCumiGfJmuQDEBsmTCcehh4/h7xw8GwrGTJ2nkDWBEL7HOcgNqFoPOw4DrdN/N7xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZV6tDOqLmHae4BVjCfvFVbVUG3z2xn+0Cf6A72NQhaUG1nL6A
	PVMhixULm1cQjH3o3/MYuTQ8PexuEPFmA46BDzfI2Fsk+hgbQR52
X-Google-Smtp-Source: AGHT+IGYhPceDBeo5lcWr74EsEhCqtuA1jD2BNecETU1tSRZBIpXXOXBfTqLCvZ2KaTfgEA0kZVi8A==
X-Received: by 2002:a05:6402:2b91:b0:5c7:202f:ec9b with SMTP id 4fb4d7f45d1cf-5cb8b1c125dmr6392590a12.16.1729773723848;
        Thu, 24 Oct 2024 05:42:03 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1550:4200:da3c:7fbc:c60c:ca4b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a65419sm5623026a12.25.2024.10.24.05.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 05:42:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: friedrich.vock@gmx.de,
	Richardqi.Liang@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: Fix Fix fence merge handling
Date: Thu, 24 Oct 2024 14:41:56 +0200
Message-Id: <20241024124159.4519-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi guys,

turned out that userspace can also merge dma_fence_chain contains
which can result in really huge arrays.

Fix those merges to sort the arrays and remove the duplicates.
Additional to that start to use kvzalloc() for dma_fence_array
containers so that can handle much larger arrays if necessary.

Please review and comment,
Christian.



