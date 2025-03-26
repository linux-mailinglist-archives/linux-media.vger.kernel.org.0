Return-Path: <linux-media+bounces-28792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F8EA71A20
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 16:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14DAC189B6F1
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 15:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7702B154430;
	Wed, 26 Mar 2025 15:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qtec.com header.i=@qtec.com header.b="O1u+Iuf7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FEA2747B
	for <linux-media@vger.kernel.org>; Wed, 26 Mar 2025 15:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743002192; cv=none; b=kbq6NhaoIb0/j5n1+VIbg8Y3+nBjR4abLzcd/VXKbfsRhfQkzM+st+TED25xBV5zS/OjsCtO4fZp8K0Uux6er/kDTfPppi+0BqukFSlxetF0C+SPtIz3hMeeJ1m03YdhrQjyc1uw6BSYozQOaMeE5xC38Qf3tX2TKA1oLEW6gGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743002192; c=relaxed/simple;
	bh=6/tmUjkepmdTzowy5RCSp/FOFMFysVqBHy/6odwGvjw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=r+SWEEqzuf0mzg5qG2hUb9ZumVFqybReZZJnDp7meOK0zOpXlq2WyBz26TKjqeYwHwygvy9SU1LbHQi5tKIOMZRBGz3OzsGheUz48vgqwaeHAXa4OoUhxohMrz9CY7sG1J2jBJpwceHk8mkK53BSRfKYavoghMWeQveGAi6KG3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtec.com; spf=pass smtp.mailfrom=qtec.com; dkim=pass (2048-bit key) header.d=qtec.com header.i=@qtec.com header.b=O1u+Iuf7; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qtec.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4768f90bf36so67484201cf.0
        for <linux-media@vger.kernel.org>; Wed, 26 Mar 2025 08:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google; t=1743002189; x=1743606989; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6/tmUjkepmdTzowy5RCSp/FOFMFysVqBHy/6odwGvjw=;
        b=O1u+Iuf7wUsbI3/ekjDqSJakWmN5tAMHXzp4o094qNkKB1TYUh/KE+TxuMmHjwpAnl
         8WFLHf0nkkSoSXjWSJ5dqY/C5QhU0yDUFcMkW/gt7c7St2SpGg+lHhFLbtqdoC2BqPK7
         ZhEsOCimBistFVdoeOG/+DG4dr2sVJ6zTCDUDcQBnLzuISbrbFHxvwKXWZDijn9JVrK5
         2zWd4/Egn0IqmadIZKYrfWq0PsPWCaD7iJHM1xVuwv76372PpudjY+HXG7Ce71Pkpch9
         yX2dHqf7U7dCeUa2eqMWfzXfvhK4lihSoOh6kNdwZpz3hOb7B2gaEzhh/3NlyKiSoXr3
         SVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743002189; x=1743606989;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/tmUjkepmdTzowy5RCSp/FOFMFysVqBHy/6odwGvjw=;
        b=PNVQe3Pk+3q6RhIdxznWSHdM0DovuivWVBytcXqyB/3ERf2ayWmKq4J/e5SyR+fA8O
         RF0I3s/6k6SUtXAm+XhoBJRgE06uOtjsvRmUN4TFI6YOSJrGPQH7Mg42xb8Khd6y6vHW
         ugsZZ1qXXyt5rpHHHRWJ3evrnKSG3hX6vVl9E5JtJfSBSQQCKI5WXqy5AvVPUArOlWpQ
         OHhGpL2+Ej+8sF97KD9MK/wmkAUI+R0S6SGvpZW2DAerNqW/cW3PPo2kKKqn04opEJBV
         i9Kg/Pof9lMKZUxr2sv2iJZg7WLKWZQyvxwONBrJJvK2aFTxdkzKhBiz2qZVY+tX93MV
         JQqw==
X-Gm-Message-State: AOJu0Yw3BZsqjOcEPngwAOjyW7yl7fo8oaQ2zqxaLV/DnSEvXVT5mw+u
	X4nzcJelzIXsqXxPv3Nofq1gYlPHguKbiKA3L/v/l+bvBW3LIi08gHo9skuDd2zxrjOsD6Zbqgc
	eXC5p5NSbV+Ns3MS0OiJsHFaVBJCCMGy0HUYopK0v/zSJkChY8yk=
X-Gm-Gg: ASbGncsES4vbrLqmv8WPlwf4pwRHX0z410+ggjNMxfjnUDMkyJ7UEzcWQqwZjiON3ai
	FN9AlPKvc6MR8KWt5WHA9eU7p4LRi/oWZMexgTjs6L8XiyLtQ85iRf4siD6AkLAbXyMMlto/g7X
	qqxw++SfiL/K/MsKHNuRVNQPRb
X-Google-Smtp-Source: AGHT+IF444WPyCX+yROx2jWT4J4khVBDOc3bBBzi/GiaYlKYhiLfVfnqoUSmQ76hFA02Se/jz3+LBYRyU6WqeHbf3Nw=
X-Received: by 2002:a05:622a:988:b0:476:8225:dad1 with SMTP id
 d75a77b69052e-4776e0bd62bmr1035151cf.17.1743002189020; Wed, 26 Mar 2025
 08:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rostyslav Khudolii <ros@qtec.com>
Date: Wed, 26 Mar 2025 16:16:17 +0100
X-Gm-Features: AQ5f1Jr4-hLgxzdo6r2C9JDB8osKAbc_VuF6MAOsuup4GGscog5BIsBJq2B26k4
Message-ID: <CAJDH93sBkYRkO0O_4nAhF4nLUFK3ufw=tPLdbvGzoWLs6Lo6Gw@mail.gmail.com>
Subject: [media] Subdev driver and V4L2_FRMIVAL_TYPE_CONTINUOUS/STEPWISE
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm currently dealing with industrial camera sensors that are flexible
when it comes to setting a frame rate, and I stumbled upon this thread
https://www.spinics.net/lists/linux-media/msg98620.html, which ends
with a patch that adds
V4L2_FRMIVAL_TYPE_CONTINUOUS/V4L2_FRMIVAL_TYPE_STEPWISE support for
subdevices.
However, it seems like the patch has never made it to upstream, and
I've been wondering why and whether it should be picked up again as
it's something that could be beneficial in situations like mine.

Best regards,
Ros

