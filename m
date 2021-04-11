Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4AE35B569
	for <lists+linux-media@lfdr.de>; Sun, 11 Apr 2021 15:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236004AbhDKNuC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Apr 2021 09:50:02 -0400
Received: from smtp51.i.mail.ru ([94.100.177.111]:35522 "EHLO smtp51.i.mail.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236444AbhDKNtR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Apr 2021 09:49:17 -0400
X-Greylist: delayed 66695 seconds by postgrey-1.27 at vger.kernel.org; Sun, 11 Apr 2021 09:49:15 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bk.ru; s=mail3;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=DCS5bgku0LFGoNK+LOToM8NW1oqmiWlymTiwWkl8OZw=;
        b=V4m9fAIAEdPW+dGErF7gx/8uTH1z1vtmQFfD0gSunY0DJWxrHDl97m1TGXbNiMiqM7F9YNMczLSWSe7+r4oc1opKQ+hMGlOfjD1rZkYztvnyXlBNsfdhmyrJyXnckElXxcnOMUltce7exWXLvltuDZlrlqWoTPKN8DeFyzpAWwk=;
Received: by smtp51.i.mail.ru with esmtpa (envelope-from <dev.dragon@bk.ru>)
        id 1lVaSN-0003RX-0c; Sun, 11 Apr 2021 16:48:55 +0300
From:   dev.dragon@bk.ru
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Dmitrii Wolf <dev.dragon@bk.ru>
Subject: [PATCH] Staging: media: atomisp: pci: fixed a curly bracket coding style issue.
Date:   Sun, 11 Apr 2021 16:48:41 +0300
Message-Id: <20210411134840.7184-1-dev.dragon@bk.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp51.i.mail.ru; auth=pass smtp.auth=dev.dragon@bk.ru smtp.mailfrom=dev.dragon@bk.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92FFCB8E6708E74807BAE725B9AE625DE765B0E193B5B7687182A05F5380850407DFF9C1872653EB4A7EB6021575DFFDB6128DDA1A0D63343F47167B29CE7576B
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE71343958AEA576E5EEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637DA5CEC9EE7F170198638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B206ED6C8DD202441F05D87ECC7E4B99230E47C10036089472D2E47CDBA5A96583C09775C1D3CA48CF27ED053E960B195E117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE767883B903EA3BAEA9FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE74B449066CFC473267B076A6E789B0E97A8DF7F3B2552694A1E7802607F20496D49FD398EE364050F0AC5B80A05675ACD1B780A39BCC1DD35B3661434B16C20AC78D18283394535A9E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B67BEEC15D15C45022089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CE44850EFB5864EA2916BBEDD442F6E682559AFB93FF5A5229C2B6934AE262D3EE7EAB7254005DCED556CBE7F905700A49510FB958DCE06DB6ED91DBE5ABE359ADBCB5631A0A9D21F23D4379F09C64C7393EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34F6110710A6CC527F893C57021E9A60506678398854B20B099512CC4567CFE5A664601BB8B02277421D7E09C32AA3244CAB2417A4E9E32DCE4BCA49FC5103B98DA8CE788DE683120583B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojyKKJYJ15DtLKp1kg4T9mwA==
X-Mailru-Sender: 3A338A78718AEC5AA85B3E7661095C1E2C5C04A378BD967FD2269DDD7FDC53E2E91E5C0C426EA6BC3833C6AC539110AEA432B8CD90067B65A6C5C4E98768B51D7AA22088860DD9FF5CDEF9E650933936342CD0BA774DB6A9AE208404248635DF
X-Mras: Ok
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dmitrii Wolf <dev.dragon@bk.ru>

Fixed a coding style issue.

Signed-off-by: Dmitrii Wolf <dev.dragon@bk.ru>
---
 drivers/staging/media/atomisp/pci/atomisp_csi2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 060b8765ae96..200f16994f3a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -29,7 +29,8 @@ static struct v4l2_mbus_framefmt *__csi2_get_format(struct
 	v4l2_subdev_pad_config *cfg,
 	enum
 	v4l2_subdev_format_whence
-	which, unsigned int pad) {
+	which, unsigned int pad)
+{
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
 		return v4l2_subdev_get_try_format(&csi2->subdev, cfg, pad);
 	else
-- 
2.25.1

