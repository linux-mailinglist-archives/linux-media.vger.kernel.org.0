Return-Path: <linux-media+bounces-20272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8659AF2C2
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 21:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF5521C21EFA
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 19:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED4A200B98;
	Thu, 24 Oct 2024 19:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3B4WL2C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8310022B64F
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 19:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729799055; cv=none; b=uCmCzPVOZraXlB1M2Gvkpxg67fq3ZFdnQZZzqQ7DMuQxp4Cyw1yvOkeVL48PhLfK7fA4i14zs1eovu8aw4BTkjMeF3V/n+9YcWRrticjJA2HzRV++zKB7xvIJJM4jHVWx3KKEXQnC5amQZrrGWadSga8znmR8MOdiGPeyYNff+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729799055; c=relaxed/simple;
	bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=QLcL5gHwato+0IMSJvSKiLUbENArKr8D3oHFYaU55d5opVMLgzofBGQ0Hm2vAEN1jrbctRpNpIWkz0kl6xq/CIWT0qYeY4V6WAd8skky9qnXLWlLJsfS04nyq22Bq0rEKSD3xYqYWL951r7mkGbUKJTof/IUpwN88gdoa9RNF/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3B4WL2C; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e9ba45d67fso6583297b3.1
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 12:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729799052; x=1730403852; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
        b=c3B4WL2CI5gd0M0KJg91ADRL1TQeYpDYiaqPIpOdq+bDUZnuu5Bop4PcAur8+hqyHk
         xTYDb7LVz330bMxdZwdz7iuOSa5nMoX9S15OHN9TRA4M41WSxY4TJ6IfwNyjaKQopdH6
         sq3T0hGKtN+xpqZgUpJdVs6r325nyHUNIiNm3wpG8DQV7UjsXTjuZ+2VT1/FQBC8Ec4m
         KKQ0MD3g3OmjIQlxsc/jnIvRxew9v26FeVbAYVGQCLvdYjDu2WpzRYeuS3xhFcMnXjYU
         SJvV/wpvs/w32MtXvcetlcIwjJOwctQC1hVfua2eNDY2qCDHYKC9NlFFqy11okUY/qZZ
         0TOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729799052; x=1730403852;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
        b=v15dL1BfU6suS79svDiCk9X1eUwdytyNvGHVJB42lt74xEU2iqVu8GBXXt12gKz2zl
         UxAT5oG4ZF8EwQ+tcQjG0V8Ik2mJtKrYof9olN8IgoEyTJHtLqXJX6d3Y4+R3njV0t2x
         2VMuCeEIdMrDiqC/cbmvZXdRC7rXh8mzhvNY2n2jihzaPR3qA8DAzZ0Gij0Z0EZo7mEM
         XQP82mnEZXw5KGcuL4q5RM6qVC717AilXeW0xdczbFFRfTQLWS3VOtOqXQwqrrUQonDj
         00YQ0kUbGZvtejBONKm4SFZSOYgE/ko2A3/maD7CAF2EOZmxgOZJE2Phvhtw6kQMQ29e
         Jpzw==
X-Gm-Message-State: AOJu0YwCFmjymzZueTUxU+rBjTrdGnlaGSzAUtEZiA+SIH5OH0ra4iFp
	4urqaL6YwDQAEd/T/GaNX75EIq3AS1x8SXOFR08W/BXDXf2rVwbnH44qCpYtRyhpqPpJKyrXxN6
	MCcOgaw2IFhQZNajAQ50L/g2axZm6
X-Google-Smtp-Source: AGHT+IEKsxB/wRUwc2XCgsC79+uT+6xpTAbx80k+R+heq5XoWsgPJzbpgoNB12yJKgVNkGUJZsNyy7gXf3MK6Vldykw=
X-Received: by 2002:a05:690c:4d43:b0:6dd:beee:9218 with SMTP id
 00721157ae682-6e7f0fa6effmr86758647b3.30.1729799051814; Thu, 24 Oct 2024
 12:44:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Gonzalo A. de la Vega" <gadelavega@gmail.com>
Date: Thu, 24 Oct 2024 16:45:45 -0300
Message-ID: <CADbd7mEMUNTgOnG=WgQAyPPKoP1D8j0pr0yctmhgPJDRXnAQ_Q@mail.gmail.com>
Subject: unsubscribe
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

unsubscribe

