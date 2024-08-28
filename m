Return-Path: <linux-media+bounces-17050-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3EE962D58
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 18:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DEDA1C21DF6
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 16:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B741A38FC;
	Wed, 28 Aug 2024 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5TKTszE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE7818A6C3;
	Wed, 28 Aug 2024 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724861508; cv=none; b=G0R5B9mSos2+8n6Yh5isgC9PesZg0C8egZFVYQ8hhqQyFO28i7aVrdmWzS2eamucuotXuYZeQS2jvj2IigP1k/YM/wh8whsBegqyfXFRqZtG9e7Csm/VXeEB5qNcLIcPsI9jOnKgfjNF4PHUQCPHTqTYPhs4SAb0m0nvhBM4eRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724861508; c=relaxed/simple;
	bh=33RAzer6xyyAOjlN7NEIkofn86OPexo8lFmAQFbiAso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enulNFisz7lWAZx6V0cyfLh2nmLOET6hTg6b29sOA82gVVrdddo08SmzDt7nNfuPYUyQuIlufHv7pLsK/8eKB9ej+OWF9DhPOH6pN7tmycceBmXpBMdyDbyADMrR/cOHAyiCiwhVJVp25tjzQDL9wTbaBbykSXfD6zVBYMq+O4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5TKTszE; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7142a30e3bdso633524b3a.0;
        Wed, 28 Aug 2024 09:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724861506; x=1725466306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hvg8jGZa8C9S66bonVoH57yWLUV5bNmVAwSjkXHOxC4=;
        b=a5TKTszEAfs0SrCplH5gkXD9jOlwlVB0WGUNpLRplSOPUxGYkmDyrUEALAsqZrtTvq
         lPznqdnBOkGba4VVQx4923yqNAxJH+Q472vMFBMBVrbjCGWkjqCVZTyYkVvMMdLqqiUi
         K5E3egr7poX+PzEpC+IfR2qmd3brB2zAS9DANRjbHD0XghVQoSUk2J391sfNq7hHn904
         VDXl88rRh0sW7Csfygdg1rNqJ99j2AjwEEs04WP3Mq6Ap5thJ55+gSUzdl8vWeI6Oa4c
         nZDiO0mGko/TFKS4b8Vv2aAbI2c/JdRIyC3xXzMqUMvtt0q2K1oOVHt1ltxL/fumOvTp
         1xAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724861506; x=1725466306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvg8jGZa8C9S66bonVoH57yWLUV5bNmVAwSjkXHOxC4=;
        b=X8m6ba6WatQKAwBj3b4+yxLt3YoEijlYOEdN/xqelB9VV8S3T0m/pFvHFIJbHhkGe/
         av45CuNTrcBPy2gWsI8iBx/St8ENeP4ikiA20L2UrZo2OEI40LRe/YAU0CM7+xnBKXtW
         JhTP+P8OboVBduwrLAqp43sjyPD8iCrXKkPxEmEn/0svV4594zkiGEhy2zDvGdWRXabL
         Om69wRlwizw/mtOcBBtDRvuyEAj96N75vPNrmE6CbmpfgJlG9sGxG7TtpnILP96OYF5D
         7vKJ8F+XV0MiFk/mMt5hVdwI2/Ktk4k9YhK4aqCHXdiP68qOgfzMRkdZvsRSj+LINJWm
         KbJA==
X-Forwarded-Encrypted: i=1; AJvYcCUxT7EGyrncWgpQxNZsZvyEkoHwaw6gJTlf7LLL4PmcJMpsW0i2EzMuuxrTh+l5+GfGyLsJVZ1uibh1LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWQAPO6qbFpW/XrEwGco2JRMf6RZLwNw+Sep8PI+maZftkHH4W
	f4tw0NhYlaQcHPzjQmmypWP1O8NMHJ3kKcN+UQr2oqo1aGtuKrDBqNtHAQ==
X-Google-Smtp-Source: AGHT+IGiqs4or1k1ms5R1WRUX9+55PPdj3bK3FVpGmjv4xe3Seg1tfrNdvICSeFnMN5+7KvP42J/Og==
X-Received: by 2002:a05:6a00:8604:b0:70e:ce95:b87 with SMTP id d2e1a72fcca58-715d0bb9e83mr3450824b3a.0.1724861505705;
        Wed, 28 Aug 2024 09:11:45 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3eb8:762:d1b6:97f9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342e09c3sm10264487b3a.122.2024.08.28.09.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 09:11:45 -0700 (PDT)
Date: Wed, 28 Aug 2024 09:11:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 4/6] input: serio.h: add SERIO_EXTRON_DA_HD_PLUS
Message-ID: <Zs9MPsBDLW6uSti2@google.com>
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
 <ccbb099a35cb788c7304795927f508cfc2342ff8.1723190258.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccbb099a35cb788c7304795927f508cfc2342ff8.1723190258.git.hverkuil-cisco@xs4all.nl>

On Fri, Aug 09, 2024 at 09:57:36AM +0200, Hans Verkuil wrote:
> Add a new serio ID for the Extron DA HD 4K Plus series of 4K HDMI
> Distribution Amplifiers. These devices support CEC over the serial
> port, so a new serio ID is needed to be able to associate the CEC
> driver.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please feel free to merge with the rest of the patches.

Thanks.

-- 
Dmitry

