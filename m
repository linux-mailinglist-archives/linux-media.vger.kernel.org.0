Return-Path: <linux-media+bounces-25339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95218A20C77
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 16:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E16811889DA6
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 15:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7881ACED5;
	Tue, 28 Jan 2025 15:01:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989C319AA5D;
	Tue, 28 Jan 2025 15:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738076502; cv=none; b=lX2NS5lVdhnGpCS4SIPuR0kLk6egUrYLJWSp11DAsw6NB2oIsWEpYYothP9YiDU//TKw96lepX28RtPyyCSarfEcVFIzKfO31kfbqLdEvRnn/JppePhFbwBsUDjwFu5Udpta6SqVRhhwAGqmP0bT6RuRoNq1Oi8hyIy6MqgP54g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738076502; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cq1JJpck/Cp47NLauoWESPG0K7ITQTEdtrXrlK/Gwjd3TqSGF1Q4Dfm6JD4DxOLvuUt3kW2p+oeb0hFpl2jOHKhwnfTycgJZ7GwUcWkgk09VREYNxksBI7lxmFxSj0pTGM2cXlC87JtbI+PWTO5xiu7PMW6KkvH30CD7s1BWGCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A7BC4CED3;
	Tue, 28 Jan 2025 15:01:39 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/6] 
Date: Tue, 28 Jan 2025 16:01:18 +0100
Message-ID: <cover.1738076484.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


