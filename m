Return-Path: <linux-media+bounces-23108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1549EBBD6
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 22:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D1E7284FEC
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 21:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF1823238A;
	Tue, 10 Dec 2024 21:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Eeeld/Sl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49491231CA0
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 21:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733866068; cv=none; b=JszuhIDvrM+ldwmG5c4PQWxQamrHbN5gYuHpLAZKpElvKQkuDAHz08t5UtLocmnyDFhBnjfnX/TNl/WvE7kBjBYzPAj5re9RdXRp+u+9H65TpWRNCxsmfEQ9N8R1jxjLK/jQtJMC363j0Ys7JcNx1Tqc0AyNoVHgzm/M/K03yck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733866068; c=relaxed/simple;
	bh=Wj6GJ2swJpdXPIA55sjM7Y0DDbLPXovMHvENa2EydwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dL5ZelOQ8nZKaUViXhwehhXtxzOgrcoxOUjoD4uCe+3OLkASrAyI/5fbTCwbCeE9PyexlvI0w/y6Diy2By5yMJvz+kwROc4ElYh/JlQ/yc/MEc6agiXv8yIwxVC2OjuN6QZR6e76kppld9LCIMJU0nXkDoeKlSTvuB1XVAKcGmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Eeeld/Sl; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2167141dfa1so517035ad.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 13:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733866066; x=1734470866; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s/YuPzifs9jEt0j1RwPUAZ3kuyk16V3hz+9XJwFbKNE=;
        b=Eeeld/SlTz4bgOE/oyJMsHNH2x40XkxXMoo0gJpwW87Wq85bZmqqwSJNnzp5VBkd35
         iPKDNXCYjXmHc7/E7gEwKYCKQAmJOFptqwm960bWs0vFDzeLdfoQDSCWh24nugzj2/YG
         oecauE1jKaOWwmvHdrzQLDADclrHC6WbIAGtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733866066; x=1734470866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/YuPzifs9jEt0j1RwPUAZ3kuyk16V3hz+9XJwFbKNE=;
        b=EvltdzMjVhw9mGRTbQFXQQrvZRy8sQqghDbxRAF2KyEYGq9kbXdnncHKccLA0KwwEQ
         5AHhD7LNQq5W/eYfpsn8WA6Ao0+yOCP8sIvCUo153UWJoUTnRw4bR9MlGmps11xI2ozY
         QVfsbLG/6e7AA7STOHGbAf6WGqxVS2SSOeHBA2RZh/N2htey9TvYyBh1eI//ueDpS/x+
         VM+lnwpGPue90FaTcZn948HoDZDWPNxTBQjgftx+zdSXJqyMMXjDm3q8XXEXW0nWYWQu
         GLTWDKCF5xzf53v3GO2vxbysnRAmLtzlzhGWKklfzWZcHh9kdIvH5WRi+Pt3S3vi3n7H
         Gsag==
X-Forwarded-Encrypted: i=1; AJvYcCWPf97yn+X+RN8k7G9d2z0Eeb2ITvaDGCBqGeYf5vmbUJQZCdUnKcIy81Rr5iJ2QxpLi6Cpd2VbnpHdWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygvImlyOJgoYBx2azX6HEoKkClhsCxCdb2M9LOdZfL4LfyqWxh
	b21CpiQUZiVh6qIKFU8Rem5cg22RbWhRO9ZVMu5VfwDcjQ3UifmiiQQBkLlaKsDnRls9c/ujSIc
	=
X-Gm-Gg: ASbGncvp+KUs2sIk0aBUptmxXfUA9+pKsjA49a91xgMYv9vdA5ee0oqytP51qX41yoL
	EvpSQ0B2/CiVYtCDbEUwsoTcJsgVbz8OjH3GzpEpntw+WPwMzT/dxi+JoQY8B41bKwtVHfRxwFO
	dWK5YSMzQKqICiLZcXnaaHx3SsIDeLpuMjmtmSSON5dYaVrLv8PGey2r/sXNLbow/QNlmxoZ5TW
	ciDe3VZfKYUJvnVpyvtkKch1Y/JR/QCo472ShQhZI5MA7g/n0R77d0SgPZmpQlGkxODW5LDumXW
	NJpPtss8yINk+E9s
X-Google-Smtp-Source: AGHT+IFwpGKaXKTm15rxfSQ5G+0qajKl0z0w1kKb882/TI/0ujdfIFTi0OlkE+ULRRlMHRXoQehAng==
X-Received: by 2002:a17:903:40c4:b0:216:3e87:ca00 with SMTP id d9443c01a7336-2177a566ff2mr4043825ad.28.1733866066353;
        Tue, 10 Dec 2024 13:27:46 -0800 (PST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2166ef7d6bcsm20090115ad.202.2024.12.10.13.27.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 13:27:45 -0800 (PST)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ee76929a98so43237a91.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 13:27:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVulwudzM5ajKKbjQOg/79NWlRWBd9DhwhggYnoqdSNo90qLuAg6tVdkrGbRN51VRG7mIw7KF+xKvhZw==@vger.kernel.org
X-Received: by 2002:a17:90a:b389:b0:2ef:ad27:7c1a with SMTP id
 98e67ed59e1d1-2f12878d1d1mr437693a91.2.1733866064580; Tue, 10 Dec 2024
 13:27:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-fix-ipu-v3-0-00e409c84a6c@chromium.org>
 <20241210-fix-ipu-v3-1-00e409c84a6c@chromium.org> <Z1isvGLLwr7jmW5k@kekkonen.localdomain>
In-Reply-To: <Z1isvGLLwr7jmW5k@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 22:27:32 +0100
X-Gmail-Original-Message-ID: <CANiDSCtFQBNjJoLF1VKR_M4zNHQWwWATu3p=-QQS-d3fY+9KUA@mail.gmail.com>
X-Gm-Features: AZHOrDm_vFiL0dGEzWST540Nxq4R6kmbJ8O_IagFBELPZMZsnuRVzRl-QCxx5C0
Message-ID: <CANiDSCtFQBNjJoLF1VKR_M4zNHQWwWATu3p=-QQS-d3fY+9KUA@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] media: ipu-bridge: Fix warning when !ACPI
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Dec 2024 at 22:04, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Tue, Dec 10, 2024 at 07:55:58PM +0000, Ricardo Ribalda wrote:
> > One of the quirks that we introduced to build with !ACPI && COMPILE_TEST
> > throws the following smatch warning:
> > drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented
> >
> > Fix it by replacing the condition.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> I've picked this to my tree and I'll take the last one, too, once the rest
> reaches the media tree.

Thanks!

If you do not mind, I will keep sending 1/7 when I send v3, to make
sure it is tested by the CI. I will mark it as duplicate in patchwork.

Thanks!

>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

