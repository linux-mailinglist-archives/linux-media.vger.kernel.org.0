Return-Path: <linux-media+bounces-14882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DACFD92DC60
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 01:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E2471F23F55
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 23:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CA8156653;
	Wed, 10 Jul 2024 23:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEKrWyys"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BCD1487C5;
	Wed, 10 Jul 2024 23:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720652955; cv=none; b=EgC8u+6BmVN/pLSe1i5WNK5Xqn5VR27Xj+VyrHh/xbVB8PqODRFqA8hagzaBndvrmPju+lLKUzL9jpAHIyawQ78COe84yYmE8fztWmwlheewOpzXzAYXNWHjJLXvNg62YK9tYiIVb0eCEmk0+yy6N15kvfi91u4sCdw9ekRe48Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720652955; c=relaxed/simple;
	bh=5oQ074TbeETxtXlYu9GH77zTW5PFA9Zg2SLucIMJk+8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h28/KoG9dZ42DHwvJVC/wpXw0UV/dNOGdfTq28L0dcD6rqJ/lkPdtVexn3225uFFt6wx9jddNLG7FxuIK0ih+dCi+MsCzCRPu9Nzbq45/UmuJTSgs51kXZeb2k5I6ASlapo8P+tIbpFTSBdz74yZJ0S2q56UBTjtLpoBDP4kHgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEKrWyys; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238F2C4AF0A;
	Wed, 10 Jul 2024 23:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720652955;
	bh=5oQ074TbeETxtXlYu9GH77zTW5PFA9Zg2SLucIMJk+8=;
	h=From:To:Cc:Subject:Date:From;
	b=WEKrWyysZlKxmuIdC45pw51ikQOqixPb+79pzr26RbIx77JdW53tjebZEj0jwBoE+
	 PHaZx2GgzWd2BMuDhesUFpU4+QE/vgGQPsd7fgyHUNgCLUgepPMGw4ovf6sildM+LL
	 D+d0InzsmEg4bT++arNL9trL86ubAdNVqFNQ8yW2u1Peg2vWEjzIzmI4PhiKJc9cJK
	 N4IrsWAaKFkK6m3gtywYu7lgUtnkai7gTlbPw/GcvmpqUPAw0DyNqDA15kBK+sRZ+b
	 SPObv/QxiTYOdAq4eVXsVB+XOqCvxLEE+eSl9XRM54PvPp1WCTv0XvnmRJ9jlX0kJY
	 A1C4Ut279G15g==
From: Kees Cook <kees@kernel.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH 0/2] media: venus: hfi_cmds: struct hfi_session_release_buffer_pkt
Date: Wed, 10 Jul 2024 16:09:11 -0700
Message-Id: <20240710230728.work.977-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=579; i=kees@kernel.org; h=from:subject:message-id; bh=5oQ074TbeETxtXlYu9GH77zTW5PFA9Zg2SLucIMJk+8=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBmjxSZtGflEHY1+s2Dchv2hWCcxlnrF7d01MmUn cjrP29v4/KJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZo8UmQAKCRCJcvTf3G3A JjsPD/9RMktNv/gThaOUgW9j7pHcoPH6MvcbfFxgMyEop5QOfVaFz51VJq2a+oSJXywHfAzFqxK 25ZCMHeJpP2jOcaWbgoEngWv1pMPgk3tzy5BCCcKibOG/Hm8zSxKIfx0Bkn0xxOFbjwjiUHvrxA cr5b8C7Dlx9vyCOSmzyM+M0SIT66jfynV+1jqGFFDmLYqCx3hdaSELdGLVEjorXjgNL1gWNQ4ev FD3xvlhFddRWP8nDVDfr6dhWSFrnW96YkCmyuKUjSE4kr0+BexiTRijKUxtjxWFV77bOeiPma0a bWL79U/AJDtAiq6T+f76VjQkhZNSjRfW+Tu3bYo4x/ddjxRsGHkYg9EsyI4XW+AOPhFQVOSVGnW h9JbU7k7eUZ3pK+C5trgQhX/PmdOPyKrZcPtfPFTkWywguUzJXqRVwgXdX1GyRM1rNoAGxC3xkP SCC5d5sVY3zKTtKQbf5EDW1ED395qHUX2I2ug/TsH6TJ9n3iVu/NE0SzREtA0Qw5FfIGwgZcCPb 3+UvjKYYI+scMrgqbHoNWbFs8D9dbMbGW/h7EM9CU6/PmnDogaHOxT7iM0oBFWTFxm+AbJqX4rF NeDVNWj/YkJMo///sIbbJZPiV5+dfNaLw6R2sXk47rWm3ND6+d3liUdsRfqAdUN7P0MeoYcQRMg zG/fiEYO749MhM
 Q==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

This replaces the 1-element "fake" flexible array in struct
hfi_session_release_buffer_pkt with a modern flexible array and adds
the __counted_by annotation that was identified during the analysis.

Thanks!

-Kees

Kees Cook (2):
  media: venus: hfi_cmds: struct hfi_session_release_buffer_pkt: Replace
    1-element array with flexible array
  media: venus: hfi_cmds: struct hfi_session_release_buffer_pkt: Add
    __counted_by annotation

 drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.34.1


