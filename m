Return-Path: <linux-media+bounces-15076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 462B4933BAC
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 13:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F9D11C21652
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 11:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D55C17F4E6;
	Wed, 17 Jul 2024 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJUgA8zR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DB514A61B;
	Wed, 17 Jul 2024 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721214273; cv=none; b=ehuuLIaDDkggFFo7IaURIs+w8oPsbn5q6nU8bHZUaTkglXzDScI3Hmyg5PSRtjUbFq+JhNTpzG9QM8eEXcLLT7YIKLjDjbA4x5Guvhtz9WkeQCcLP1pOo6T5a2dvIXZLIPayqWvJw6QBzujc6EzleNMUUEaisL9d6lyU0jhB3wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721214273; c=relaxed/simple;
	bh=b7LvGuAMDgLWRLN0jDRswesp0GHvGFFR+0W1/+lWb4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Opw9eMpBk2LxLkw0aNw8mieFw0EKWAK/l1e74low1OA8vfrAQluz9uTAVoEbmd+iXBNCJd5IfeEZZfsDLZibqam3Y9B4nXzyZkHNIV2o04+T4oMkd018RniisWyogorn1PhNFpq58BEcbfXdLE9o9BNdSpNsxZn+PHoWmO3MQFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJUgA8zR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273F6C32782;
	Wed, 17 Jul 2024 11:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721214273;
	bh=b7LvGuAMDgLWRLN0jDRswesp0GHvGFFR+0W1/+lWb4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJUgA8zRlJ+M3frjrkEac7/suB52KHAsJR6ANkYtUeVH1ftg5kQo6eYqoOHaYRl2l
	 XGjTTYG9kZhq+6jjwYW0MG32qZqJQWuzWVN0EwBY5Cw68c9Ru2l2wj9Qt5vy2KCq7O
	 cVJn6TdQCduegz3MHwB8sEvE0MVdLcC9sGI4ogOLdSToawmXA6SAdpPLof8nG98mYM
	 QQozqJzZ+w+7e/qlJfW6g3pdKsfIrEES8NIkdsC2G2cXd95vcZ5Peyb9hH5eIYUJqL
	 wnjFd3C1etmBw/JfXNOIZsw/5TszyiR65EDJc8SA3J7Iv+F7E6UCQJ9K3VTxIEFOAB
	 bbZWeQmIhB71g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sU2SY-000000004xL-2tym;
	Wed, 17 Jul 2024 13:04:34 +0200
Date: Wed, 17 Jul 2024 13:04:34 +0200
From: Johan Hovold <johan@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hansverk@cisco.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Milen Mitkov <quic_mmitkov@quicinc.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: qcom: camss: Remove use_count guard in
 stop_streaming
Message-ID: <ZpelQj6HufZTe52d@hovoldconsulting.com>
References: <20240716-linux-next-24-07-13-camss-fixes-v2-0-e60c9f6742f2@linaro.org>
 <20240716-linux-next-24-07-13-camss-fixes-v2-1-e60c9f6742f2@linaro.org>
 <ZpeJmWTfZGUXsc7K@hovoldconsulting.com>
 <2d8ac288-da60-490a-a6ac-ebe524e3fc21@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d8ac288-da60-490a-a6ac-ebe524e3fc21@linaro.org>

On Wed, Jul 17, 2024 at 11:43:02AM +0100, Bryan O'Donoghue wrote:
> On 17/07/2024 10:06, Johan Hovold wrote:
> >> The use of use_count like this is a bit hacky and right now breaks regular
> >> usage of CAMSS for a single stream case. As an example the "qcam"
> >> application in libcamera will fail with an -EBUSY result on stream stop and
> >> cannot then subsequently be restarted.
> > No, stopping qcam results in the splat below, and then it cannot be
> > started again and any attempts to do so fails with -EBUSY.
> 
> I thought that's what I said.

I read the above as if stopping the stream fails with -EBUSY, when it's
really restarting the stream that fails that way after the first stop.

> Let me reword the commit log with your sentence included directly :)

Sounds good.

Johan

