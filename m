Return-Path: <linux-media+bounces-7174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1B387DA0B
	for <lists+linux-media@lfdr.de>; Sat, 16 Mar 2024 12:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31CC5282038
	for <lists+linux-media@lfdr.de>; Sat, 16 Mar 2024 11:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702C017993;
	Sat, 16 Mar 2024 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mfg1.brcemail.com header.i=@mfg1.brcemail.com header.b="fSELvGGx"
X-Original-To: linux-media@vger.kernel.org
Received: from mfg1.brcemail.com (mfg1.brcemail.com [216.169.98.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA4E1C2D
	for <linux-media@vger.kernel.org>; Sat, 16 Mar 2024 11:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.169.98.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710590388; cv=none; b=jBtdoFX0K8hqvoz67aQB7K2kcGJ2l1apahT/y0hqJ7Fva842MHtwuKnQyLe0wdY+im0I6LBiki4jbln5foHJozOmIAyzOCe0s9LFWG1VvwdyPbkco3Itg9/pmsaDpqAG5QWT45yfQMZEjdULHJjgTbCIPE3FCfY++pdynk7+/3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710590388; c=relaxed/simple;
	bh=NG+xwPXU/kvLpvjh+4mBQiQLbL1ePaJWhYXmNlK+rdc=;
	h=From:Date:Subject:Message-Id:To:MIME-Version:Content-Type; b=ohGuu9OZexGTG4X7lyxe9atYyJWlR6Ort1UMkJvAIcd7llxyorPY870iVYEEl2wEafrdOAgvq1jKCKMGIJ5/O9NSR9/f1t2GNSTtFJ+BwfP/J1zn6Mu8/RnK8uwIVK70augduy74fRHi5+yS3RMFTsFkuV5AIxmWJB27Qcoii14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mfg1.brcemail.com; spf=pass smtp.mailfrom=bounces.mfg1.brcemail.com; dkim=pass (1024-bit key) header.d=mfg1.brcemail.com header.i=@mfg1.brcemail.com header.b=fSELvGGx; arc=none smtp.client-ip=216.169.98.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mfg1.brcemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounces.mfg1.brcemail.com
DKIM-Signature: v=1; a=rsa-sha256; d=mfg1.brcemail.com; s=api;
	c=relaxed/simple; t=1710590377;
	h=from:date:subject:reply-to:to:list-unsubscribe:list-unsubscribe-post;
	bh=NG+xwPXU/kvLpvjh+4mBQiQLbL1ePaJWhYXmNlK+rdc=;
	b=fSELvGGxgqLXqGCL+mJJzCwn9EhK7fQtKqlnht5qUq1yoBzrS3m4mpIgyfExm1QPoafKmownxPd
	tZO+eMPPdLalEP7TVkgQh1my6KmASxI7JanH96BtfJ0fEmO8UOt8v1cZTaw9tXJXpBMQpMuwIZwoL
	kq2B+kL9dX7e+NgJ5Nk=
From: Sophia Wang <Leo@mfg1.brcemail.com>
Date: Sat, 16 Mar 2024 11:59:37 +0000
Subject: =?utf-8?b?8J+RjQ==?=
Message-Id: <4umjueriv2l1.8fCi5g4iHO5dzcVGQfJShg2@tracking.mfg1.brcemail.com>
Reply-To: Sophia Wang <sales@jcmolding.com>
Sender: Sophia Wang <Leo@mfg1.brcemail.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-Msg-EID: 8fCi5g4iHO5dzcVGQfJShg2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SEkuTGludXgtTWVkaWE6CiAgICAgICAgICAgICAgICAgIFRvIGNvc3QgZG93biB5b3VyIGlu
dmVzdG1lbnQgYW5kIHByb2R1Y3Rz4oCZIGNvc3QgYnkgcHJvZmVzc2lvbmFsIGVuZ2luZWVy
CldoYXQgSSBzYWlkIGNvc3RpbmcgZG93biwgaXQgZG9lc27igJl0IG1lYW4gdG8gbWFrZSBs
b3dlciBxdWFsaXR5LiBXZSBqdXN0IHByb3ZpZGVkIHF1YWxpdHkgbW9sZHMgYW5kIHByb2R1
Y3RzIGFuZCBkbyBtb3JlIGFuYWx5c2lzIG9uIHRoZSBwcm9kdWN0cyB0byBhdm9pZCBhbnkg
bWlzdGFrZS4KIE91ciBjYXBhY2l0eSBhcyBiZWxvdzoKMS4JQ29vcmRpbmF0ZSBkZXNpZ24g
cHJvZHVjdHMKMi4JUHJvdG90eXBlIG1ha2luZwozLglXZSBpbmR1c3RyaWFsaXplIHlvdXIg
ZGVzaWduCjQuCUJvdGggbWV0YWwgYW5kIHBsYXN0aWMgbW9sZCBhbmQgbW9sZGluZyBtYWtp
bmc7IG1pZGRsZSBhbmQgc21hbGwgc2l6ZSBtb2xkCjUuCVByb2R1Y3RzIGFzc2VtYmx5IGFu
ZCB0ZXN0aW5nLgpPdXIgY3VzdG9tZXJzIGxpa2UgQmFybmVtIGFuZCBBU0EgcGxhc3RpYyBm
cm9tIEl0YWx5IGV0Yy4gRXZlcnkgeWVhciBJIHZpc2l0ZWQgdGhlbSBvbmNlIHRvIGRpc2N1
c3MgZnV0dXJlIGNvb3BlcmF0aW9uLgpPdXIgc3Ryb25nIHBvaW50IGlzIHRvIG1ha2Ugc21h
bGwgdG8gbWlkZGxlIHF1YW50aXR5IGN1c3RvbWl6ZWQgcHJvZHVjdHMgCldlbGNvbWUgdG8g
Y29udGFjdCB1cy4KaHR0cDovL3RyYWNraW5nLm1mZzEuYnJjZW1haWwuY29tL3RyYWNraW5n
L2NsaWNrP2Q9dlJ1WlhKN1FRQ3U2djZUWHBQZU81ODZ4QWN6azU1S0VLX2s5MGt6NkJKVm9Z
WW5tQzZYdzF2Q3dlRVZMNFhKNnVUaGl0bU8xdy1mNEdNVXlaZnY3dE1nbWxiYl81anpKVHJ3
Rk9YdGlOeE01RHdRSjNGVzJuMUp2S0lmZFRZWklzTWpLc0Z5M05FWVdwRmVjc3l3LWM0S09q
dDRNbUEzQl9wU1dqWTB4QkFJejVGY190VXRVOURhdUhfS1RuZjFjY3FtMjhvcjVfeWJ4OV9C
TWQwMzFUYmJNaU1CMnFNSUdMMXRzd2RMajBENVdzdTZxREpVTUVuNVQxTDZCUEw5WlYtM3Vm
cFFPcWM0dlpDaVp4MGJJZmg0MQpodHRwOi8vdHJhY2tpbmcubWZnMS5icmNlbWFpbC5jb20v
dHJhY2tpbmcvY2xpY2s/ZD12UnVaWEo3UVFDdTZ2NlRYcFBlTzU4NnhBY3prNTVLRUtfazkw
a3o2QkpWb1lZbm1DNlh3MXZDd2VFVkw0WEo2dVRoaXRtTzF3LWY0R01VeVpmdjd0TWdtbGJi
XzVqekpUcndGT1h0aU54T18tanAzN04ycnJkQlV0d2U3N2lLREc3NkJYY1dKbmNISTU0THpk
SWZLcERFaTBVU3A2eEt2MFhtSzdWRGxvUktNUms4WGNMcENNUk83QXFiNzgzSWJxdjlJeEoz
MVNybjhfRVZma1dWWXJibmlaOHVBcWF3ZnVBTWRQajRpMGFuZ29QMW53Q1VBNlVMUER3X2NV
X0FUUjdSMU1NSDU4R3BTX0JYcjdlT2lRN0kxClNvcGhpYQoKPGEgaHJlZj0iaHR0cDovL3Ry
YWNraW5nLm1mZzEuYnJjZW1haWwuY29tL3RyYWNraW5nL3Vuc3Vic2NyaWJlP2Q9U1VmWlNR
amg4YkMxbnR6V0R6VW9sQjBIZF9YZXFGTmsxdDdKSGVQOVpnMGZOcHNaWDNkeUVyY3BRdzN5
eHVOd2xtbkFBbnB0clZRLXd5ZTRZdlBscEdEeEVTekF0TGw3aEl2QjNWWHBTdEtSc1RRdGp4
aVdvNTFnQVRCZVFtWDQ5MmswbHhLdFlwaXUxWDFOVlY1ZUZEZFVmaHVHa21ob3lwaVZzNlFP
RXFBZllWWkxaMHJOOTJvZG5UYUxWcjB1M1hLQlI3eTdPcVhlbWViVjZyQkNOWDlMVzN4d0Ey
b0p5Mk5HWE1JcG93aWpURWFITmRrNjlCUmo5bVBkQjRNbXhTcExCdXZyeF9XZzgwbUJOZ3Uz
SjRoWkhXMEhCWnlIdWVzc0NNVVVPbmlxMGdaTWFYT3RKYmVkTDRJQzBPTk9VZHJHbkZzUkE4
b21jZ3l0OEJWcFdSanI0aHNHZVZSaFh4SmpRV21vaDNPSE9jNlVsYUV2cDA0WkJlSmg5UV9k
amFtalJFN2VNMERrRDFHLVljN2o1b3ZEVTFEUHVlam0yLXhIVVJvb3h6c05fdGxSczBGdy12
ZXprQkIyZjVZQWo3UkZMaTZQZjhQSlNGQzExeDRXa2ZvWnBpYXQwd2d6eUFRR19CaTNsV1Zv
MCI+VW5zdWJzY3JpYmU8L2E+

