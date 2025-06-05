Return-Path: <linux-media+bounces-34112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5134AACEEAE
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 13:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC9CF3ACA27
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 11:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA72217664;
	Thu,  5 Jun 2025 11:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b="cdhSOKSO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB4217332C
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 11:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749123970; cv=none; b=MxVVjaX78Hij4BEpHOZtWYK0ldyrMWLtrdLwcEoABivsaoc8WY7G7Z0Hs3siDVmd/hXJTUyDPUfcNkfBkt2MRtYYY0fIfdTZ4h58K5q6R1KZwdp7eqDc5El0gztedBuEKFNMl+c08UgE+x3/0D6AZAhNCX/6bB7QqtkGLEkupnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749123970; c=relaxed/simple;
	bh=iQO05gpQItZLYXG1Zfr8HBbssUlGS1zmiv5QaiGMLKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlggM0ljWJxbuz5jtFHMMH1X+w2r49pHVeUfkNJkDrCyVQBiv6+suzTGgm+dj8+1vf4/QMjX5qaMEmtdAuscRJbVrXBMhscIgODZ3UgsYVtIiP1m2/p22Yjiv3rIFOsoXCoWNXcRb8fK4TfUJNkHCSIwj5TZRYKUcf4rQ3AsgWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io; spf=pass smtp.mailfrom=foundries.io; dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b=cdhSOKSO; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foundries.io
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55324062ea8so1158698e87.3
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 04:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1749123966; x=1749728766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5SAInOCIc0R3rDAo0uRf/uJKBXTBXwLj+VmUCa2gyU8=;
        b=cdhSOKSOe/H9RrUDAvJCqrSisDESfRQ7ZHW22Se4bPDYQM3eKQaqUBQQiqh9Yh2CyY
         8X85Nb7mbg6KInY9dstrwrovYMDq5y9eK9xa1mQVcIF7BCVohLK37u/E1nkewvr6+mCA
         wd67aXdhUwuDk6a1WYptwPtaskJDJpFl9gtgsSfpFJ6S8o+qAcXeSaQzOLpfLd2LcwFi
         UoRNzUVbV2li4iudSO8OJffrR6GxVEFlZaxf89apjaMUXepEs/5mgd8IciBW6A4iFKRL
         81ZBkNzkcEELGLTHtP6Z6WltIzsgvt6DnpemWZSGZW/XM4B3bjazJFMSMnEXrkeOSh4j
         b22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749123966; x=1749728766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5SAInOCIc0R3rDAo0uRf/uJKBXTBXwLj+VmUCa2gyU8=;
        b=uyOWcnA5ghHILVRTQz+qVXx7tf1ZYQN/ZbrRAFh15nI/hrF0VZn4VSKtiduZabZ5yk
         wgKFF0bWsVatnP3R5Egd5Ha3dpmkjYyjKd4BviKL1kbJYlhmG/szsVnVxgX98qGqRifR
         c9SUsPPXqbdIstS+i/3gD1RbOCVLlWLZwO4smxTcuRdhg4b4c12nkZvASygR59bOh8uZ
         ge9OMkhA9t6GC+SvkQzrTPXP/v4dozv5yfXtLle1UOk8Bc3Bt1odkoUMruTB9oL0fjSx
         Qa+aQsEuDkZRgIaFihh8Z+lZfRwCo/vApFqNnrzRrt0/yEgVZwGHu1G/Z63GtWWJMXqH
         rI8g==
X-Forwarded-Encrypted: i=1; AJvYcCUnc3kb9tQeIQhjieP23vrJTuKtrujyQOK11ZAX1JYpzX964o9MAptIw5AeXO8iVTgQUBdC+GPw+fF0jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEgMyHWpT2xQI06qQrHHlnTL/F85YSDUzVkosjtHTB0rozeXJr
	Vl6JxUOXijZ7YApY1c9WX4CuqLTWXpLxChh7zHpzTQ+mE0rKDP8RqEuAV/YI1IxJG5U=
X-Gm-Gg: ASbGncukQfJ5T7ZiR07JCM5iPOwG8E6NM8VWjnrjkBns0UH3xgtn/TH4LD+gFrQG5XY
	54c3rZYadFq4AOzvjcTh8AxK4dyWEKxjv6AaNwRE+cjIoRzfJ0toB/1wxMdza6/E6Me4yMTLH0h
	TSqsdk//dHQJjcHVjh2+BL5rjj6+hndg0KnzJQ5DnD/+a4ZkmH00SilOF4HfSKChDAFag/3vn8t
	0sOoOjHHBNumRN82Tkwovln0KTY7OPrTUQ8EajpXXE96TkeQjhkFYamqLGGIfKzeztIuUeLvYSo
	rvB7IZGigMB6v6Fgdp/D9h6pe21tZiNlp805J/9FSCBsxkO3YK8kSVooN7HdQIuOw+ahn809ahD
	Hhm9U2N/Du7FEp93aogUQMn7lqYhbITNbi21rXimj7o8z
X-Google-Smtp-Source: AGHT+IEsAAI7LB6jIT0s5Hgp6imppc5SwEXxcbKnPFUWJbLbdX7aqzZ+RhH6SI0L2rhRu3BRtYgb5w==
X-Received: by 2002:a05:6512:104a:b0:553:2450:5895 with SMTP id 2adb3069b0e04-55356af64a3mr2190303e87.4.1749123966226;
        Thu, 05 Jun 2025 04:46:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337910e17sm2594296e87.153.2025.06.05.04.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 04:46:05 -0700 (PDT)
Date: Thu, 5 Jun 2025 14:46:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
Message-ID: <jib57gdjieerjgq22ghgtqtl2haohlgsldwn7krbsqyjmntvvr@4dql5exqyu25>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
 <903b0a04-f905-4a9f-b637-b146495988ea@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <903b0a04-f905-4a9f-b637-b146495988ea@quicinc.com>

On Thu, Jun 05, 2025 at 07:24:55PM +0800, Renjiang Han wrote:
> 
> On 6/2/2025 2:16 PM, Dmitry Baryshkov wrote:
> > On Sat, May 31, 2025 at 08:05:24AM +0800, Renjiang Han wrote:
> > > On 5/31/2025 4:27 AM, Dmitry Baryshkov wrote:
> > > > On Fri, May 30, 2025 at 09:32:12AM +0530, Renjiang Han wrote:
> > > > > QCS615 uses the same video core as SC7180, so reuse the same resource
> > > > > data of SC7180 for QCS615 to enable video functionality.
> > > > > 
> > > > > There are no resources for the video-decoder and video-encoder nodes
> > > > > in the device tree, so remove these two nodes from the device tree. In
> > > > > addition, to ensure that the video codec functions properly, use [3]
> > > > > to add encoder and decoder node entries in the venus driver.
> > > > > 
> > > > > Validated this series on QCS615 and SC7180.
> > > > > 
> > > > > Note:
> > > > > This series consist of DT patches and a venus driver patch. The patch
> > > > > 1/3, which is venus driver patch, can be picked independently without
> > > > > having any functional dependency. But patch 2/3 & patch 3/3, which are
> > > > > DT patches, still depend on [1].
> > > > I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
> > > > on QCS615 over(?)clocked.
> > > Agree, so we need to make sure that the driver patch is not picked after the
> > > DT patch.
> > Worse: we need to make sure that the driver patch is present in the
> > branch which picks up DT patches. Otherwise building & testing that
> > branch (which is not unfrequent when doing git bisect) will fail.
> > 
> > The easiest way to ensure that is to merge driver changes in v6.N and
> > then DT changes in v6.N+1.
> Yes, now DT patches are pending videocc DT patch. I think the
> venus driver patch will likely be picked no later than the DT patches.

Please read carefully: it's a question of the patch being present in the
_same_ branch before DT patches are picked up.

-- 
With best wishes
Dmitry

