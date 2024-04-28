Return-Path: <linux-media+bounces-10282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE95E8B4D68
	for <lists+linux-media@lfdr.de>; Sun, 28 Apr 2024 20:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 382091F213B6
	for <lists+linux-media@lfdr.de>; Sun, 28 Apr 2024 18:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931D77440B;
	Sun, 28 Apr 2024 18:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SvJBhrkH"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A09973534
	for <linux-media@vger.kernel.org>; Sun, 28 Apr 2024 18:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714328819; cv=none; b=aaUIF4brmZtl122TrjbuzY0vDsBBMBO/+djgs/iHuCTAEX54EOI7nNf0564mp1FjStDhu4tiv4E6QwrLx1hwDbAQ2GbUWk41Fb0nYC09eU1VSWx2xjPk9VxKvQLVdZqx3q/mZo8AT05rC/TwoMLbXWg1GpTrvUoeKkPn+McRf+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714328819; c=relaxed/simple;
	bh=kei5YX+f+OSil/nD2cY8heTI4YkEV6nKcynKuRa2x9U=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=r/hewibsqsEJsras9YOcjJ5Xd7yUAZndqMpkWYUrDqAV7ssq7niY5qtlBw07rPqEEMY+XGiNFIJVgd9tN9IRDaOiPf5E6rmNLPNNaY4zEbxKJOYhWlb61CkkFxtKi9otxp/zSFpYIRx3fvo71hA+ccekDMi6tCUHb698HWtXBgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SvJBhrkH; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714328809;
	bh=kei5YX+f+OSil/nD2cY8heTI4YkEV6nKcynKuRa2x9U=;
	h=From:Subject:Date:Cc:To:From;
	b=SvJBhrkH3tiEoi87a/9P2ni4rd2V1SGKMkUHAJX4fK66q9FEKMU9HM7pcdzhtzEvI
	 B7U0quMQxicBUvvMTnbTKmuPd5UBXh8hvyueK4IlcbhIlydArr8QFyYMXfrJbcgMFq
	 WtpI4f+d4SqR8dl7IP0bWITua5VSKVHhh10IYbTQvmwNBvvrrkAHQZMnZNzxTZiivH
	 r2CA/LHl4m5O3l8R+P5iaZvedWoZOH6WwMdjoNkdjNtOR1x/FBA1fFSKL05cPt0H7P
	 GnhiOgq1c/VJUnyxlxUIxD1eXf4NEJCxLbVfMvmlwSEnyqm+6nR6eX2YkM00zNKIT6
	 1iEFjNH872+JQ==
Received: from smtpclient.apple (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: dwlsalmeida)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2B8EC37813E4;
	Sun, 28 Apr 2024 18:26:47 +0000 (UTC)
From: Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Discuss the multi-core media scheduler
Message-Id: <3F80AC0D-DCAA-4EDE-BF58-BB1369C7EDCA@collabora.com>
Date: Sun, 28 Apr 2024 15:26:35 -0300
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
X-Mailer: Apple Mail (2.3774.500.171.1.1)

Hi everyone,

There seems to be a few unsolved problems in the mem2mem framework, one =
of
which is the lack of support for architectures with multiple =
heterogeneous
cores. For example, it is currently impossible to describe Mediatek's =
LAT and
CORE cores to the framework as two independent units to be scheduled. =
This means
that, at all times, one unit is idle while the other one is working.

I know that this is not the only problem with m2m, but it is where I'd =
like to
start the discussion. Feel free to add your own requirements to the =
thread.

My proposed solution is to add a new iteration of mem2mem, which I have =
named
the Multi-core Media Scheduler for the lack of a better term.

Please note that I will use the terms input/output queues in place of
output/capture for the sake of readability.

=
--------------------------------------------------------------------------=
-----

The basic idea is to have a core as the basic entity to be scheduled, =
with its
own input and output VB2 queues. This default will be identical to what =
we have
today in m2m.

 input        output
<----- core ----->

In all cases, this will be the only interface that the framework will =
expose to
the outside world. The complexity to handle multiple cores will be =
hidden from
callers. This will also allow us to keep the implementation compatible =
with
the current mem2mem interfaces, which expose only two queues.

To support multiple cores, each core can connect to another core to =
establish a
data dependency, in which case, they will communicate through a new type =
of
queue, here described as "shared".

 input           shared         output
<----- core0 -------> core1 ------>

This arrangement is basically an extension of the mem2mem idea, like so:

mem2mem2mem2mem

...with as many links as there are cores.

The key idea is that now, cores can be scheduled independently through a =
call
to schedule(core_number, work) to indicate that they should start =
processing
the work. They can also be marked as idle independently through a
job_done(core_number) call.

It will be the driver's responsibility to describe the pipeline to the
framework, indicating how cores are connected. The driver will also have =
to
implement the logic for schedule() and job_done() for a given core.

Queuing buffers into the framework's input queue will push the work into =
the
pipeline. Whenever a job is done, the framework will push the job into =
the
queue that is shared with the downstream core and attempt to schedule =
it. It
will also attempt to pull a workitem from the upstream queue.

When the job is processed by the last core in the pipeline, it will be =
marked
as done and pushed into the framework's output queue.

At all times, a buffer should have an owner, and the framework will =
ensure that
cores cannot touch buffers belonging to other cores.

This workflow can be expanded to account for a group of identical cores, =
here
denoted as "clusters". In such a case, each core will have its own input =
and
output queues:

 input      output           input      output      output=20
<---- core0 ----->          <---- core1 ---->     ------->
                                    <---- core2 ---->
                                    input      output

Ideally, the framework will dispatch work from the output queue with the =
most
amount of items to the input queue with the least amount of items to =
balance
the load. This way, clusters and cores can compose to describe complex
architectures.

Of course, this is a rough sketch, and there are lots of unexplained =
minutiae to
sort out, but I hope that the general idea is enough to get a discussion =
going.

-- Daniel


