Return-Path: <linux-media+bounces-12661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D618FEDE4
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 16:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6685B24315
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 14:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B4A1BE25C;
	Thu,  6 Jun 2024 14:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFqv49IY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D18A19E7FB
	for <linux-media@vger.kernel.org>; Thu,  6 Jun 2024 14:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717683535; cv=none; b=ZwvSBgCmbD0axTBsku9zFDQah+RnkiySNm7dYcY4pIcEk2IU5oxc8laiJHoFlQG6kIZ5hvec3G+dJS775Hfyqmq26Hy17VN9Zuj+DF8pLLq2XM12fzf9mlTGCeVK+mHU+ATOVTPnF8rjR/oXiMveTNTd1BDw6SUcfXDNLhtWXTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717683535; c=relaxed/simple;
	bh=DGeEQkkZybd6AHvp59WOOgt3owudLHH0Ov3iPoTzZPg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=AjwYRkDlsaKEUHFwDjVN5ziN+YFsSgzACNik3B0qwuWtax8FxM31uh2i+/3lQr+S/A0fodNTmt1eeDkpDEiZKBYiVmzfmyOMgpL8zCpWw07+zTGyPLW4lxeKjo9/TLBCAEG6pqFYKK5pt+xMrN2WOB+7Lk5lFeS/C4wG2jAe71U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFqv49IY; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6f8d0a00a35so604968a34.2
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2024 07:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717683533; x=1718288333; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PpLENcpKK27RZoc5jk6qAlA4pgrdKTBjJ9LX1+rkuaw=;
        b=VFqv49IYbZXKmESIdLJLJzh8Iy9Hp6ElMsHabwtHOp4O4aL6GauNZ7GTn7Tl8V3xF6
         K3ZISAW2yX7E/SnRoKOTUtXRIlzyvcljsSjoZo/zZxU3cs3/1N01CbHh06x2X9NBki/s
         20b5lBoJ6+PBE5gByKtCa07E4KHJTxueOvlNgTZQl7ZwWMzMyS3WQcQasR97/A2YQ56Z
         zA0/Ck7eIZj8YsdZGBL4Kw5EPu2teaOSz89kOuXTvzbgSIlg80rmfrbo15deDPXk7HhF
         MFZD3F9FU2azaLOyFrQNcB9vWdzBzau0wbsqFjpcSAR+JABABNmDvazzwiSDeBXocgsp
         VWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717683533; x=1718288333;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PpLENcpKK27RZoc5jk6qAlA4pgrdKTBjJ9LX1+rkuaw=;
        b=vOL1qvQL/WtxDb6WEoL7aPqjsphlSOPtPeUdsAYEnhFCD2djvMbUSBYoK/ECf7kDbX
         9+/8MSbA/yAl/DSBryT9fGEtT95DImBOJauFoaUwdgUnwQoYCNKgH2uEH/XnZgcWXhvn
         HlFHQLuHbteVzK/d/HlxA7H6w76WPjTBT5GvpTToiG24vQAYHkNGPAM0/BReqx+ZrlPW
         /cnSjWd7rzKt0reQijdtpDevezoSbv/9PUP1f6+DMY7mYxzIoaDqXzwbkA+7ekpgBh44
         2M5H+TihAuCLYfJmX6GEpa8aYAa2OJTZpmA0oFE2ViSCOPiF/e6XrT64TH42JU2X4Ovs
         6AVw==
X-Gm-Message-State: AOJu0YwdWzso/qrrgUUmy0K72zbSleRlIJU2NXKPjMSjunfiaOBAh+JH
	lCn/UH1Ypl95R82gnOaLGEzy0AaGWLNJi6VyOWHpg58mWDfPZf36QDs3enAqTq1aM3/EUIsmPrs
	64NByn+aTjxh+qT6PGX3KLH1nah6kjrAM2fw=
X-Google-Smtp-Source: AGHT+IE5pcCb6NdttONYW2DZcKQ45oSbd2T3z52f1btKIo38uNqXMKhV9xfGghErdxfPZVBDEtD+vPSan4hhxhKeaPk=
X-Received: by 2002:a54:4486:0:b0:3c9:6f32:48ae with SMTP id
 5614622812f47-3d20461acb6mr5661516b6e.47.1717683532879; Thu, 06 Jun 2024
 07:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: vdm736@gmail.com
Date: Thu, 6 Jun 2024 10:18:42 -0400
Message-ID: <CAJ-JD0YbaZaB-iB_HkqjA5EZmzcj4MZ1FBqwLFv5PGQDpy6hhQ@mail.gmail.com>
Subject: UVC device not listed in Supported devices list and is not working.
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Device ID:  041e:4095
Name:  Creative Technology, Ltd Live! Cam Sync HD [VF0770]
Manufacturer: Creative Labs


Vadim

