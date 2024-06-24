Return-Path: <linux-media+bounces-14019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E07999141F3
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 07:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BB4A284B27
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 05:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2B618044;
	Mon, 24 Jun 2024 05:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZgdVGTl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120BA17BB6;
	Mon, 24 Jun 2024 05:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719207001; cv=none; b=EeKMRFbPJF8Ro5GtjHKS/+xwjybNKPVw1964GfXjJiVb7Ek0brK1Fq0dF6kEu/vVlzqyFXWOVbWERAlzI5QpDnHP7QIq3B69+ZSfj7mTJG9LPkt63TyyhtG3yDsncwVJWgSHOAy971CQO1ZOBfGOtHldJ/sBPocyuhtTjCR8D3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719207001; c=relaxed/simple;
	bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=tbYzcnTJ49T0u3VjjfrTHLj057dbosJV5nQdCtbUNBPAllOctRhBS4NtVsJ4TISXmA/Yi3HqtizIsCjZX0RWtT/FE2mdois9iq/WzNObe9n07uVNMaf4zcNYdeTtZZd6cLZIApPZzU2pOTExp2c3fRR49dSLSStZ2Wve0MEu5ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZgdVGTl; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfa71ded97bso2999392276.1;
        Sun, 23 Jun 2024 22:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719206999; x=1719811799; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
        b=BZgdVGTlN5w5KH/CG6E3QrGGtiob7lpMb8+j0nEdR+YQ0ecLM+BOmqGgn+uZHaeIp0
         JSK5dRWvqFxWs7Dg5c7Rre8LZBGWpb8n7u/C4j8DeYsOdbU37wfanuqRBWgJdE4UFZEK
         4EJTUmx5kYnLPx3GTu5xe3FfaTS17lCJb9r8E4iR1VEom8XFz0GiMb4qHvowo/ZXaHKG
         gvQXAOmSw1xFP+Ki1hDt1yXIwPlwp0mtnre8Y/NzqJu/TU6Z20oxrkMFIuWwIgvEisvB
         TZjyNgzQkdbsrBHvNN6HlHBcD5TVlY0WcAIyY70TiZaQ8suBvPFxPFhwhEHrZyE2pJOy
         MCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719206999; x=1719811799;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wjunn4+x2QEs4HRrQcozT7INn2DM0lGSHIZkmkDz3T0=;
        b=nu5acV7acquMr+aBHq77uMHSaCMxaFl1wWI5PuwUJ0R0N/W2uIq9hL6Q/bwkQiDSbI
         mjdVhYxfQHBrNtn9nAtYgB+7CYrvSHVtvkav7heOF+Pl+5Nh8/LBQad0DXQ3aIQ0FUf9
         xshtUqDo2cuWVh5e6+hPmd7Rg6NICflaR7dSBlNWQ4kW0CBLBwmUMPMwv92q7RNYt/L1
         8nOnJJ70+kcxBvEZ4bgK3pbZYJjNxDhGkVxaol7gyLP5i8TdR7RhCulsH3D5tPKrELKI
         j7vAziAG1xeBHYilmjkjQ2eaPkFJPJnaAfSwkEWHR/M210pIbZkyrcN28BmzAbjyCs+y
         z3cw==
X-Forwarded-Encrypted: i=1; AJvYcCW2C+SNli3pcb3S6a2Ts9IeRTb+62MBj5A2MKOow3m9muFaxmc5SaMWPO0qNkaJPevPQfpUxJDYnU5p/rnxK6e+7LwYfDnl3dLY33eiz3ZBcbSsbkI9ze3Q57uvfNENU695BH28BLs+npfYD7I0ZzdJby+0s445vT8=
X-Gm-Message-State: AOJu0YzXqQJTbgLh8qAJ3SreTlCo4SF3G31AhcphbctjZFJd5IlQVa0v
	dhLUWc7tbXsmo50EUpsyBZFimfNGGOkqB5EtJGl4iOxACVmf9jK7stM7PQixqz4D7abaM92D4X7
	P1clX9K+h8XQALj/lBJcuW0XUqSMvZGH1pHs=
X-Google-Smtp-Source: AGHT+IG23Pg/Xs/aUD8kTu5bcFQJn1fpUSQJ72MHQdTAAxm8wif9Dtg2Wk+9pigVU4jl0tVyJEVgAuCgkVageWjPltE=
X-Received: by 2002:a25:2d06:0:b0:dff:2d23:962f with SMTP id
 3f1490d57ef6-e02fa2c163dmr2422652276.19.1719206998650; Sun, 23 Jun 2024
 22:29:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Delyan Raychev <delyanr@gmail.com>
Date: Sun, 23 Jun 2024 22:29:45 -0700
Message-ID: <CAC9Q+rSEUrDaA1S3pRRv0TspsQ649TkHiCcPb0PcPzqsoZBr6Q@mail.gmail.com>
Subject: unsubscribe
To: linux-kernel+unsubscribe@vger.kernel.org, 
	kernel-janitors+unsubscribe@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

unsubscribe

