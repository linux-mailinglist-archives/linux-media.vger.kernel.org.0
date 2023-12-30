Return-Path: <linux-media+bounces-3083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1342F8203FC
	for <lists+linux-media@lfdr.de>; Sat, 30 Dec 2023 09:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C9721F217C3
	for <lists+linux-media@lfdr.de>; Sat, 30 Dec 2023 08:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336C21FAF;
	Sat, 30 Dec 2023 08:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfoyXWCO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BA9210A
	for <linux-media@vger.kernel.org>; Sat, 30 Dec 2023 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-35fe8245d0eso25253485ab.0
        for <linux-media@vger.kernel.org>; Sat, 30 Dec 2023 00:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703923702; x=1704528502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTFPw7SSCy/tJCxWpvSz/wr15aBQzl2Y5J7YUlIbDmw=;
        b=QfoyXWCO9jSSu1AsDdVas5VoDgCARzFEv4uYnDuIHSwTP8HwlaIGHisWoqP+DTxeZd
         XTmq/KzH6MN/0qwzpVfP+GbNigH6wi9/FXSz7cxNHBFhoscCWOl1BdKIgStn7fX96L4f
         MFFnJyBxJ8UsqqOiZ06QEr0lFJ/HOVILAEO9NVmKHExeE8E6qHagNSpSQe9Z5byJzJoA
         cyHordE/TFW/gmXi/KSTvgZRzAV6EYHgHCQbp8Hm3d1Wqy73+gzIK/EEH3i8M/HCR1NQ
         6OxiXXn+5I/7WISAKPtzhi4PkVQFqm8xjM5ZE5LCtyDgK+GAZYSzNao2/h0bBsVHl4hi
         xYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703923702; x=1704528502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTFPw7SSCy/tJCxWpvSz/wr15aBQzl2Y5J7YUlIbDmw=;
        b=TbPnndbfRVAB/Py8zATR/jyfEfrkRDdUwhyELPHb+irLLL9FuAuaEZRKUWZ/a5vsWa
         aAZOIOP5necdA+FjyNHM+vaRc+t4YBYBsAkzOGtEwYN40s8LTZ086YVgdS2Pql1/XTRr
         XCTxZlUpIU6UDCELc1tAiMKgw50ZrEuRea0ipt32OD6ByiBOTHgRPsNORlylum1UR2Xf
         No4s6osgv2sWHwxZGsY/0UiANzDLSeKOzSE+QgEWhU5EHLVL2EwsQrn9/mjiZOIWeFce
         3M0E3nppl1ZshgTM29zsH+oloN8KnyVY0FMLKs71NU0qQXgCKsxcgXTIPm/dRhM1YRx5
         ImIg==
X-Gm-Message-State: AOJu0YxdzUO20w7k+hHFE/QioG/IORJwwojPOrc2uIUw7JGbR86gUDk3
	litINgs82YmFGMn66Ob73Hw=
X-Google-Smtp-Source: AGHT+IH0aH1upL9AXxloMy3Lj7gxqSeJEG3P+zNJLpfJS7aBFOusjZnwkW84Y8sMLcgBMWV+McC6uQ==
X-Received: by 2002:a05:6e02:216c:b0:360:303:fe67 with SMTP id s12-20020a056e02216c00b003600303fe67mr10265162ilv.22.1703923702423;
        Sat, 30 Dec 2023 00:08:22 -0800 (PST)
Received: from localhost.localdomain ([2408:8207:2540:8c00:23b7:4d83:3222:c5dd])
        by smtp.gmail.com with ESMTPSA id c1-20020a63a441000000b005ce472f2d0fsm5413911pgp.66.2023.12.30.00.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 00:08:21 -0800 (PST)
From: amazingfate <liujianfeng1994@gmail.com>
To: krzk@kernel.org,
	heiko@sntech.de
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com
Subject: Re: [PATCH 3/3] dt-bindings: media: rockchip-vpu: Add RK3588 compatible
Date: Sat, 30 Dec 2023 16:08:14 +0800
Message-Id: <20231230080814.3736970-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1b6787cf-7f39-4d27-9ccb-62f538b31933@kernel.org>
References: <1b6787cf-7f39-4d27-9ccb-62f538b31933@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many thanks for your kindly review. Please forgive my newbee actions.
I just learned how to reply mails with git send-email so forgive me
again for my late reply.

I have just sent v2 of this series to maintainerers and I will send
v3 later.

Many thanks to you guys,
Jianfeng

