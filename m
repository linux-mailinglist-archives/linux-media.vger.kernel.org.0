Return-Path: <linux-media+bounces-12162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A9C8D3A6B
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 17:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 921031F237FA
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 15:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B4E17DE30;
	Wed, 29 May 2024 15:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zsn6g6+3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E35B17BB2F
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 15:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716995569; cv=none; b=c/7niavWbGARdymOcUYir00vEih83Xo+fDFl0k0XSPmp147nbgMHm24htZodNzbrlb51IhgnYhhLt5W0WOEWHFR9pMd9H4arrKDvBByVeo0qEaT2r7Znu56chIutg98nOaCrtlRTQucdtlllWTyLLKoEqNC1sxu53mR3dph23Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716995569; c=relaxed/simple;
	bh=40yGqp9H4Gw/tzPXQqD9gBrUrE7u7++WXsmZMPJOBlg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=QMaBv48PRkLVjTIwWhKl+NEGtFW6woEurCVil82vdvL4DTRswtZWZepfwve7qJvaKLk99jymmgIyqwfrfW+ZGfbVhpO6ZGkltzeR9Pe2GgmjO4vDdWQDABedAef0ONRuM9ss3YbszEx3AouBgBGkOIu9VA/azYBdn1cSpSiVYJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zsn6g6+3; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70109d34a16so1820504b3a.2
        for <linux-media@vger.kernel.org>; Wed, 29 May 2024 08:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716995567; x=1717600367; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xSZSABEL2KpGBOwcALuAQKVRNjcriFkLSVlGTuHGag=;
        b=Zsn6g6+3Z+h4SDuGHxMCjcjXC8PnxkHA5o9v4FkuA9rC21ytyCk6KYIp20lWOdk++B
         dn7SkSE/DkjmeI6z+zWedA/rMlNuNa6voBjH1A361fXr7FTHBRh5N3G7/Vsbl/tIV3pH
         Mv6zKjpPq97ceFjhHB/LTlDCJCVh3KOYoLGD4tZzw5yslzP7ZyJ6UgY8+WcefbZsUMtB
         HjBQmKWqxlpvixoSKKMT5oqYW31LrUIdLi/wO8bSZ+euqyNjQO03iWeHVzQGTOYKdteX
         FGQXWfB9cnZUhuoyUM/3OWSkctHtGLQPeCCaLP54shRIjAbURgd9bE5dvRF+ESpB+1+p
         KwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716995567; x=1717600367;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3xSZSABEL2KpGBOwcALuAQKVRNjcriFkLSVlGTuHGag=;
        b=AVrjaJmD195aOyHyQIsk3mhoqdG6kcV3KpZfOi5x/tjtrL+yAuAlvev5FYDeFkSz9D
         myQ93Z43pnZeFP0Mma9fZqjfKxLhafCe+1wWeHMnjiK4Zn2r5EQU5zdTJfqBZdXzfr4d
         jJPzEyMsuSqYFFbJ/kVhudnJeu9yRrJqANIjgMaJeagkvWKs5/FkRH1qJO1dRESWcjnE
         NJxKHJALHFqxPhV6zreg4hAIhWzZGIsuOjDbB/ZSrhgkSwfHtSLKzpY26pXaIEBi7X1m
         +gnStlNkZcGrMi+/MpBOjLawcQcwIL5U5RpOmzR1JBaGvDL64/x0GiOP7r9kLokk1eXq
         0AEg==
X-Forwarded-Encrypted: i=1; AJvYcCVguTAD/4JOFH9qKfN3bS/TCz8KMPceoMWEW4MKd9sx/2qGMWI7/6pTPXtn1lTgec+uK/bJwY9+1AHmB68E868S6bKGQTj8ZqYfXv8=
X-Gm-Message-State: AOJu0YwdQIGFO8k+OBhmtr914e0QcavlZ5zayUK6UHvcjv0BVrMlJpd9
	Ht4BuWEUhAIzSaM1Kqjzv5ACrpI8phFHq4voUj1Cqf6MidkFvAf/uOpkDg==
X-Google-Smtp-Source: AGHT+IGwleIg6I5voj6ZhTklzZLY/lNES+rpJPyfYtudDAsZWnaycutDYIt5i1JnMgu0f2xay5Qa5A==
X-Received: by 2002:a17:902:c40e:b0:1f2:f1bf:cf44 with SMTP id d9443c01a7336-1f4486d51c6mr181988715ad.6.1716995567311;
        Wed, 29 May 2024 08:12:47 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f60f2276d8sm2198215ad.115.2024.05.29.08.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 08:12:46 -0700 (PDT)
Message-ID: <bdbc27ba-5098-49fb-aabf-753c81361cc7@gmail.com>
Date: Thu, 30 May 2024 00:12:43 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: media: docs: build error of userspace-api.pdf as of v6.10-rc1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Jean-Michel,

I tested "make pdfdocs" on v6.10-rc1, which ended up in a build error
from xelatex:

    Package tabulary Warning: No suitable columns! on input line 48770.
    
    ! Extra alignment tab has been changed to \cr.
    <recently read> \endtemplate 
                             
    l.49179 \end{tabulary}
                          
    ? 

I know this won't make any sense for most kernel developers.

So, I did bisection for you.

First bad commit is:

    adb1d4655e53 ("media: v4l: Add V4L2-PIX-FMT-Y14P format")

and reverting it resolves the error.

It looks to me like said commit added two columns in the flat-table
of "Luma-Only Image Formats", without updating hints to latex:

    .. tabularcolumns::

above it.  This results in wrong column count in the output of
Sphinx's latex builder.

Please update the hint for the additional two columns.

FYI, you can test build without building the whole tree by saying:

    make SPHINXDIRS=userspace-api pdfdocs

Otherwise, you will need to wait a long time.

You can ignore the extra warnings of "WARNING: undefined label:"
and "WARNING: unknown document:" due to the limited scope of
documentation.

Regards.
Akira

