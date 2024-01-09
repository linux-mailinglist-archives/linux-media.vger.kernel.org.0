Return-Path: <linux-media+bounces-3385-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D6D8283EB
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 11:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 312B1B21B67
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 10:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B17360A8;
	Tue,  9 Jan 2024 10:24:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB14636084
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.14] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 1671E5CC97
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 11:17:55 +0100 (CET)
Message-ID: <59383033-924d-45fb-a44f-7c274bb44517@gpxsee.org>
Date: Tue, 9 Jan 2024 11:17:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-media@vger.kernel.org
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
Subject: qv4l2 crashes if output device implements VIDIOC_ENUM_FRAMESIZES
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
If a driver implements VIDIOC_ENUM_FRAMESIZES for a output device, qv4l2 
crashes in general-tab.cpp:2169 due to m_frameSize being 0. As all other 
usages of m_frameSize in the GeneralTab::updateFrameSize() function are 
guarded by "NULL checks" an obvious fix would be to guard the "addItem 
while cycle" as well. But maybe a better solution would be to add the 
frame size combobox to output devices as well. Or are the output devices 
not supposed to have frame sizes enumeration?

M.

