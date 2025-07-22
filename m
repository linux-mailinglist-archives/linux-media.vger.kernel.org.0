Return-Path: <linux-media+bounces-38204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E403B0D484
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 10:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE87F7AF815
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 08:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEFC2D59E8;
	Tue, 22 Jul 2025 08:25:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A887828BA90;
	Tue, 22 Jul 2025 08:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753172724; cv=none; b=TKnaG4hgOasaSalN63z9lLL+x0t93lqqAjGKEYXIaEZ929IAnSY4l2+mUFxPfZKvcP2jp2qQBpYgUarK/AYyyykynxufqUnwQnk4UEjkgXa/k6+GdOz+ocOMMLTjakGhSeNmB0HRgwLLcsaJjDoprwCUNRpwVjfkNQFIpYSmd9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753172724; c=relaxed/simple;
	bh=YsIudX3xv2xYvYgtcQKZTU2AE5HfxzanINZy+e+9wsg=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=RVin5k2ByYTJEZdzHRyxQ9aGXIFPuV9Aa3rRro9IgWpuzaUHFOT/bIaQHWsE6BVIwgE+oWrobiYIQKdKMc2RMKFuQgCQMxPv3oYmZuuy6oEvT7nk/zZO0PgigOWnxCM7uhetetv9elufHdJDbbv0+vUalr4qsmzfF9wFRcdDiCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bmVgy0lD2z6FyBw;
	Tue, 22 Jul 2025 16:25:18 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 56M8P1Ox064185;
	Tue, 22 Jul 2025 16:25:01 +0800 (+08)
	(envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid31;
	Tue, 22 Jul 2025 16:25:03 +0800 (CST)
Date: Tue, 22 Jul 2025 16:25:03 +0800 (CST)
X-Zmail-TransId: 2afb687f4adffffffffffe4-58500
X-Mailer: Zmail v1.0
Message-ID: <20250722162503608C8ow7vBASGsFHaQUT7zd4@zte.com.cn>
In-Reply-To: <B54095728F89524F+20250722075605.24998-1-wangyuli@uniontech.com>
References: 20250717160707018ilXWr01CnLXI8dTRDVKy4@zte.com.cn,B54095728F89524F+20250722075605.24998-1-wangyuli@uniontech.com
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <wangyuli@uniontech.com>
Cc: <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
        <eperezma@redhat.com>, <jasowang@redhat.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <mst@redhat.com>, <sumit.semwal@linaro.org>,
        <virtualization@lists.linux.dev>, <xu.xin16@zte.com.cn>,
        <xuanzhuo@linux.alibaba.com>, <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2M10gdmlydGlvOiBVcGRhdGUga2VybmVsZG9jIGluIGRyaXZlcnMvdmlydGlvL3ZpcnRpb19kbWFfYnVmLmM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 56M8P1Ox064185
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: jiang.peng9@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Tue, 22 Jul 2025 16:25:18 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 687F4AEE.000/4bmVgy0lD2z6FyBw

Hi Yuli,

Thank you for notifying me about this. Please proceed with your patch directly - I have no concerns.

Best regards,
Peng Jiang

