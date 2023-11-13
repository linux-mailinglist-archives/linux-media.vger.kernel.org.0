Return-Path: <linux-media+bounces-200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C467E9A21
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B97E280CAE
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 10:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDAC1C699;
	Mon, 13 Nov 2023 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3B81C2A2
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 10:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40302C433C8;
	Mon, 13 Nov 2023 10:22:07 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	alsa-devel@alsa-project.org
Subject: [RFC PATCH 0/8] v4l-utils: add v4l-audioX support
Date: Mon, 13 Nov 2023 11:18:41 +0100
Message-ID: <20231113102202.258725-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for v4l-audioX M2M devices.

It is an initial version and it needs a bit more work. Mainly adding
support for the new V4L2_CTRL_TYPE_FIXED_POINT, but that requires
some more work in the driver patch series.

At least this series will get the basic support in place and adds
a vim2m-audio test to the test-media regression test script.

Regards,

	Hans



