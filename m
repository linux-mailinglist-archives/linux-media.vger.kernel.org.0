Return-Path: <linux-media+bounces-20016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BE59A9A31
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 08:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 820CCB2236E
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 06:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B7A1465A5;
	Tue, 22 Oct 2024 06:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6P9FxuL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48BD3232;
	Tue, 22 Oct 2024 06:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729579482; cv=none; b=XyjmdvOQU2MtxxMnRIfSqF40BqIOtR3n0XsppnLyOZrVBwjxlpH84GJrGMMYqZwAYcdwcLJqJhah6e6aUX66Dki8oYD2fZBUZ3UgwMc11ajg/wkM8/mt2Bu75rhGb4t/IRK/t3j4ayVQB35I/leURNJ3iPvUmhjDOKhbeX1D1Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729579482; c=relaxed/simple;
	bh=ZA5mEAnOWy9OAlVJWo6cS0aX4OvXMwgnY/Opz/ow7XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XHmYZxP/joY2DzbuZ28f1aTXbRoTeTSrB9Y3u9/Rm+dHRe2XHD6S2nTZ++YECKDIvhxjwdsys9nx7gd9HDMfCJ+jGbAotYCXBsFmb71Qe/54rVVADfYIgL/cRZ6zwnUZGeaBQ9Tvk8oi5UAyUmCX5wwc9GLRo7b4z/tOAMrBBGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6P9FxuL; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so4261726b3a.1;
        Mon, 21 Oct 2024 23:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729579480; x=1730184280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxgWfYk6RsfNKEy9+LQHYE8HYCPmjjlwPvsciN/vF+c=;
        b=S6P9FxuL1zV0jyn1x5aKj9WK2kYUWFmH31WEukUqTbu2pNpZeUdS6F19N6djWzFht1
         IVmz6K5ZeZKDBU1gyLuW2tr1IrLXecetUznvN3mVro5v2iquDm5+ThllWEcx6CeqlqTI
         83KI6PebzTNc3vYonZ0qDobQDzJLueVE2GNPKuGgnlag0pBbxr3aFhibIjzTB8on8veV
         JoZ5VBNxwqsWQ8KmnSG56lxgg7Tw2tg9CNC4e6inpo6jQcwG1eRhRw/gUx0imIziOLfM
         Y9eoAqj1bqxhTmyYWPGXyORTAv6JrE7kneJ8sEUoy75Oio5Tt8w8sqT7GLZ58Y50ZqGB
         3PVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729579480; x=1730184280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxgWfYk6RsfNKEy9+LQHYE8HYCPmjjlwPvsciN/vF+c=;
        b=rWzwLBEKpSPsCOnYMyjIX43CkAFcofoXf6BDOaMtpaua3gH17KrVyN2gXk9wjmw09j
         CdrO1Q2gnbR7j5g7BIDxChQQbeRKezlDc6hE9BMjMVNiD9dYev6z6CAUkIfJnG/g1EwK
         ZfQ7vrDGJVPR29a7/Mfk7vcq9sBXaVnyd2y+zZ95eypqox+eTt5LvnDeOUL8fyDrXfqJ
         4oDAdST1PfdJfy2PIStfVKZ+c527hPG3EmiP9UWr3ADJ2eIC2x/FDGnq+8o+BQyfsYO+
         o0xwTU3Ew+Qy1mWUd22Imp1ybujjsbkYWNgCxIZBNtOHtehsxMJ2uTjSNZmau92opV/B
         JdKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfZfEMc+k3qAUeURwQecHUCdwtI/AMdm0BgMhipQgTZ5W/7tKl6kmBDn7TumBIIJJGfehJOxmapI/Ws/k=@vger.kernel.org, AJvYcCXyBnMV5jCTBLU6JgZYZBNkDlfSKd+muhe4sIHX4KN7a+9roSZ3x6dqAxbamUY/1WvT5SKPz3ix/CXwCzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ocXXJtPgM3kJDpYDnbJGfQIdP+peyjugPWFGEJcUqOCqnyfm
	DQ/iNUCIazi5A/4lLG3ZjHvcfRd32HHuWfDuYIquzWNBEWX2ubw/
X-Google-Smtp-Source: AGHT+IGhP8r3CFpAF+d15f/9wkzHjVCJEatiKTQRq2iuUCFW738yTKt/tIhDtbjY18NKeBn0uYaajA==
X-Received: by 2002:a05:6a00:2302:b0:71e:5a1d:ecdc with SMTP id d2e1a72fcca58-71ea31d2c22mr20110650b3a.17.1729579480136;
        Mon, 21 Oct 2024 23:44:40 -0700 (PDT)
Received: from archlinux.. ([2405:201:e00c:517f:5e87:9cff:fe63:6000])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71ec1312d1fsm3988625b3a.5.2024.10.21.23.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 23:44:39 -0700 (PDT)
From: Mohammed Anees <pvmohammedanees2003@gmail.com>
To: angelogioacchino.delregno@collabora.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	moudy.ho@mediatek.com,
	pvmohammedanees2003@gmail.com,
	ribalda@chromium.org,
	sebastian.fricke@collabora.com
Subject: Re: [PATCH] media: platform: mtk-mdp3: cmdq: Remove duplicated platforms checks 
Date: Tue, 22 Oct 2024 12:12:40 +0530
Message-ID: <20241022064250.143591-1-pvmohammedanees2003@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <427feed3-f51b-40d1-8609-4534a2815fc1@collabora.com>
References: <427feed3-f51b-40d1-8609-4534a2815fc1@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> This should've been [PATCH v2], because this *is* a version 2: even if you
> have changed the title a bit, it's still "the same" patch ;-)

Oh okay!! I didn’t know that one should have marked it as v2. My apologies 
for that! Thanks for being lenient this time, I really appreciate it. 
I’ll make sure this doesn’t happen again.

> Next time, please version your patches correctly.
Absolutely!
>
> Anyway, apart from this not being declared as v2, this time I'll let you
> get my
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> ...because the patch is good, and because it's only the first time that I warn
> you about this :-)
>
>Keep up the good work!

Thanks!

