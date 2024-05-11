Return-Path: <linux-media+bounces-11382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1158C3356
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2024 21:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 712A7282281
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2024 19:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646AD1CD0C;
	Sat, 11 May 2024 19:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=comcast.net header.i=@comcast.net header.b="OXFsvcLN"
X-Original-To: linux-media@vger.kernel.org
Received: from resqmta-h2p-567408.sys.comcast.net (resqmta-h2p-567408.sys.comcast.net [96.102.200.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B92366
	for <linux-media@vger.kernel.org>; Sat, 11 May 2024 19:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.102.200.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715454186; cv=none; b=p6ncJ0qJs9OHIEVmBftBozuVLAsdKEfH6Pkyeba8AK/gdRO30EuAPlQiNg7VN9SVaDuvp5P6UzhpvZ1uZ21DxQDUzfJp/wykC255Jdc2Gxb/C3eMkjD450X3sjDDtMx911oi7kbfZZVYTBpBN4MoNE3BZTHOK1OEok4Wyv0za2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715454186; c=relaxed/simple;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rnoF07wVEaUwpSfO4jaLyYV/OHiC/3OQGu1cdg49uJa79/dHu7h35mPI+RQUqDnIZLdPSIlo71nFpjk0lRuJmVYNSO7ERxvqfdGU0Jubx67fu7FaB3xgJ7cfilIW3kQeOSFuugnVkGmKCd/yNGz/CXyJNjr/QoSd4KHapzYFxoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=comcast.net; spf=pass smtp.mailfrom=comcast.net; dkim=pass (2048-bit key) header.d=comcast.net header.i=@comcast.net header.b=OXFsvcLN; arc=none smtp.client-ip=96.102.200.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=comcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=comcast.net
Received: from resomta-h2p-554994.sys.comcast.net ([96.102.179.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by resqmta-h2p-567408.sys.comcast.net with ESMTPS
	id 5rcXsMpqAaPnH5rxNsN7Cx; Sat, 11 May 2024 19:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=20190202a; t=1715454029;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=Received:Received:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:Xfinity-Spam-Result;
	b=OXFsvcLNc1Utt3trD0HT4LvxChd22Dv5s6hedOjRoz3wEZlSN6gW6hdzTC1PabNme
	 xn4a+2UXh8Sj6oUGrj6OtD+aulyDEyxu+OeUOyuOa7vQ44Zsz0LOrfYMI4mU4rdQVi
	 yB7cx+6/ul477yyN4d02Uxvo8QkwOW56yHXxWjw3z7Q6Fs5wpdWuczlBrhk3Po92C9
	 xEmswt4cTpXNQPGjPihCutfi4+KF/8u1Xad77qkMXGV+tsMEY7LPCmOKlpGihy/RSI
	 X7QNjmCA/jz3YQZ1sq3y6ldww4NrOvZM6PlkjVlSnCQmZjmbHySRIZFRECsphvB66T
	 6GiwR0vGNG/Sg==
Received: from hp-i3.shibaya.lonestar.org ([73.29.228.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by resomta-h2p-554994.sys.comcast.net with ESMTPSA
	id 5rxJsrlfn8D5o5rxLsi1dw; Sat, 11 May 2024 19:00:28 +0000
Date: Sat, 11 May 2024 15:00:25 -0400
From: "A. F. Cano" <afc54@comcast.net>
To: linux-media@vger.kernel.org
Subject: subscribe
Message-ID: <Zj_ASYaOCnQEl5rw@hp-i3.shibaya.lonestar.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CMAE-Envelope: MS4xfMab/3OIWB7wm1LTbhnhIJkfgsdrhIw6MOcK4G8PFybzbl8a7C0iaZNHDVc/6+8acyf0Aqq5biE51kYlO5r6/bNKEirMcLhY5KByHAexAxyqawzQ4P8I
 rANekM4hoIZzf0uYxwS/x90m6lEu5U5e+C7XpSt2ncM3lOnKKSRwe+Rtf6SKSbKu6JVtH652GxQzUFZ/NrHBJtjFCluVV9NkwUU=

subscribe

