Return-Path: <linux-media+bounces-16434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DEB95616F
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 05:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 926E91F213FD
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 03:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D51922064;
	Mon, 19 Aug 2024 03:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnra8QG4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD260224EA
	for <linux-media@vger.kernel.org>; Mon, 19 Aug 2024 03:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724037926; cv=none; b=KVE5p1/qTZ5VCPWnW58w9r4f8s39yJejlCy74Um38Nr3Zi8RMVVym4C9Ckrwc4s0PnQmOQLcAQEYqLiP3i8uxk3B8TD3sV+JQqJaX96AsQMAVa28gpjg7hrhC2UCeWNasR3kIAM0T85VRsv+jwkn/lWN63c2/9+DaacrwgTRqWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724037926; c=relaxed/simple;
	bh=3NIIpBMlvscW2LAHFdhGeBCfq/TSYlyTzg83ivX5Xn0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=uTkUDeOxJzO0tfsWWRsDO99glLBKjDptE/VAXiGsaegFyt50xmAlN1RxhCN9fXkQIAKyh/AC1V8oUR/utbD6fhxdhX10QDtMsxXBQm69Qt74TAQCMDl+J38+0utUtjqcgizXYyHcxrSXnoAVkhNchhH8sYGO4mXZGLUjfYwQHq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnra8QG4; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7c6aee8e8daso2681137a12.0
        for <linux-media@vger.kernel.org>; Sun, 18 Aug 2024 20:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724037923; x=1724642723; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zszktvq1b/o/Z4l+EfrcHNgTpAB6adPwuby15DrXx1o=;
        b=fnra8QG4He/XOOY5DFR5uue8KYJsxMm19a5Mm+rUYkCeGV3s+NGPcCIVNdxFAvGXh4
         zSvFxnWDYKH31nrysDi22LNMfsMCPkCiCGAC3nRglsZVFGlPaYDA/DQ8qnBz5bcsgGT3
         prLxxDeYXXgqck/p01vp7EO7O5qVWHX6q/9ZEChkp0QJq54JiTesem35qcRqU6LsJ8ob
         usZc+q0DddMmvvGvu2JGYu2nJ/HZqo2WEkIdW30AMcY/fxLyLuN1e6aAf6P/Sh+CMCy1
         6EmYIytQcVXGmGLdbshSzNQI85o0hjnQKg4LgmbA44KtRgeQClAjFe4sUBw5UN6p840O
         aWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724037923; x=1724642723;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zszktvq1b/o/Z4l+EfrcHNgTpAB6adPwuby15DrXx1o=;
        b=vrFDyvmCIXWBZ/8Ncx2wTNfioTWU1GBiPf4yH42tgdeVTVRLQyj34NIunsp+7xXqYb
         h+lkVmxzMXepY50b9xXCtuUyFjVJXT/UQLf8GtgerbghK3RblIqF92uezV2emDf4iHNw
         jqTJJsVp1+6Hgv8Y73jgDI29gIuu5LxPwPbnM//0JjxydY3ow4GRrue4kIAR8GINVDNZ
         RtzWzKEr+S57UgjemaUvHrMuZ3p58b3Tiilfa0Uk8byerkMDK/aN7CxOk4x6PnjWZRbk
         tbSK+pU4B2zYb7QPF2YVfyPwOI+fHzP3G8EPGUGpLTqCv8FC071Y++6TDfDtQKqcRCqZ
         VKCQ==
X-Gm-Message-State: AOJu0YwwFPpYcAvB4dQL3xThe618wBihKR7ve2LR4wJ9Tadb3aoPbPiH
	X8BgSCzKKo2zQsrO7oGeZPaxOHtQ3m2VI2ZlRaMuDhMNZNwMd6cdi2BiZf0eGqoRANeYue5XgJA
	KPop7sK+4kPgrDgM5pLutg46K1/0E4maP
X-Google-Smtp-Source: AGHT+IHPoVwzzKrZMHlqX6aFP+I5yPdFLL1gcfkLez07gr1LH3iMOYYa2+yhNTs3mue2pUVfp3DzR71KPIF/YMDGpjQ=
X-Received: by 2002:a17:90a:8c5:b0:2d3:cc62:929 with SMTP id
 98e67ed59e1d1-2d3dfac689cmr10822190a91.0.1724037922701; Sun, 18 Aug 2024
 20:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Luc Ma <onion0709@gmail.com>
Date: Mon, 19 Aug 2024 11:25:10 +0800
Message-ID: <CAB3Z9RLU8JO_1AsVkJ89gt2PR9SqOJhqOV3jVRzNXMVewdxtQQ@mail.gmail.com>
Subject: subscribe
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

subscribe linux-media

-- 
Luc

