Return-Path: <linux-media+bounces-21574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B6F9D21B0
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 09:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E02D282BA1
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 08:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F278019755B;
	Tue, 19 Nov 2024 08:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VL6/yT0T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8F41531DB
	for <linux-media@vger.kernel.org>; Tue, 19 Nov 2024 08:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732005469; cv=none; b=rna6cECmUKyqYDk2ikVjVs/yNYPHDTTMErQjbqk/NFUU2f6Xcydl3IK8pux8N6Iufaa8WtJOST3UNQe5S/X4sZxYCzEVZyMRo31smgSPN748EZXA14qSlpRLtNds2OtCa3ajjBnkYuzY8ST3HzJLvM3NP219mWf0PD22CDTfIpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732005469; c=relaxed/simple;
	bh=L38dPH17EpLR+QgskAPBbVngwLHSH8GPxNeSjWHAym0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KK0ZbOrBUf7hG50HJ9z32YGkrLG3CngTDOcJq9djIKiS88TAY9++9P1DKjbgwr/AKyLseK0xxaw7j1NaqtAfpDPZZQWcon1U18pJDcU1bLagjUpy+wrUpVXgnL3LviHKfmTQIu+AqDt4zNdBqYBemdekcVtqDUyt5iF4iFkMJoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VL6/yT0T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADCBC4CECF;
	Tue, 19 Nov 2024 08:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732005469;
	bh=L38dPH17EpLR+QgskAPBbVngwLHSH8GPxNeSjWHAym0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VL6/yT0TtOrYrUvK2y7yS9/fWnD4pYs3kWeTP9TZbHfN0bY3IR/sk3zlrLW2F2Zrd
	 QOnuQemJqaxs+HfMJlpBfAluiZqA0KfoBYnq80Ncqwn4qvxJXHsF5Tny6RkRSYmEgY
	 7Oh9UmhqXf6507LO91d+6eQZJP5R94YnJIDYEBAuEndvwxyOMXcnI7vr4rXvT+F4fB
	 fXwkUfn/ESWc3Mq3WcXS8LrcNdN3Vc70ZOHCwqN0o6ZXLp/4cxi9PsLedNx8vBDhN/
	 hjvMumCqaSqtWRmzaTclvoG7hit3akGq+YvlyHwseOCnO7gw7H6qcOgwOk5CKc5c/9
	 NnkkZ1V+Lg1zA==
Date: Tue, 19 Nov 2024 09:37:44 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: media-ci@linuxtv.org
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [media_stage/next] Warning: commit has extra committers!
Message-ID: <20241119093744.61dc01c8@foz.lan>
In-Reply-To: <E1tDJfe-0003Ar-1p@linuxtv.org>
References: <E1tDJfe-0003Ar-1p@linuxtv.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 19 Nov 2024 08:33:14 +0000
media-ci@linuxtv.org escreveu:

> Commits at media_stage have unexpected committers

This should be, instead "media.git". Fixed it at git config file at the
repository.

> 	Douglas Anderson <dianders@chromium.org>
> 	Lucas De Marchi <lucas.demarchi@intel.com>
> 	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 	Rob Herring (Arm) <robh@kernel.org>
> 	Heiko Stuebner <heiko@sntech.de>
...

Thanks,
Mauro

