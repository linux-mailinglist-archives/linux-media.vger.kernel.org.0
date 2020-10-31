Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF4C2A1AB7
	for <lists+linux-media@lfdr.de>; Sat, 31 Oct 2020 22:33:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728480AbgJaVc5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Oct 2020 17:32:57 -0400
Received: from mout.gmx.net ([212.227.17.20]:59917 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728420AbgJaVc4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Oct 2020 17:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1604179972;
        bh=9uAnbEhyZD6TGPwVlCPtZ/QXZccE+izuatvELYWZEVc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=UX/sMYar14tpBCMUaLzdiLm1oG9mPbNN8Abjig0/utOtqRSfH2NTcl/DIGpImDr0o
         905UGWXDlcp5sYVZ6FIcODMpq1t/cLGN5HlZEYWU4Vei6lpURNoA7TA+8LnTaPWVK5
         Q42jLTkHWkE7fXuWGPHbYY30G6CrFYczCPfYnRnA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.162]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89L1-1kUptf2BSl-005FN6; Sat, 31
 Oct 2020 22:32:52 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvbdev: Switch to new kerneldoc syntax for named variable macro argument
Date:   Sat, 31 Oct 2020 22:32:30 +0100
Message-Id: <20201031213230.2816220-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Bm+qHQLcLbD+sTByEqJyCf2ojlEVKzrG9VVu03XxvtptXwT/a+D
 LhMfI9i5wewyECjhucICXnPQMIHlRk33jsGPLERPzKeqkAGUBHDRfAVNaqSaYo2w/C+9Bsb
 YSGnjhIpymcAbmEw+OlzL78mTw+DlEFAzHeH14mXGv3bGQPmuydJi4lc/xINVEfVBVTXxf1
 wFg2LhfN1Uu1gnDdjDvGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZAFc6yJQUJQ=:YUl9IB6lKK3Cgoc5FfSyzw
 HrT0QpuVp0AIG83v1WVmfx2t1MEgJZWkEagsu25UKgVv69TjToqMOZ140EIPDLLq8D/qoKwIn
 QphdzN6i/29so45J9f3DR5XsIGWBEHua9pcFW4JkO2oB5/6jG0HcPx8X9f9sy/78AKBLu2lh/
 BRj0i+kovdd1MDTAhZhG5o/9bjR06vrkaXvdoJ/KsdJrj0RwvpKlFGapmYWVjuXUn1DxqE6HV
 Q/88mbdShYSx9+K0ILMspzdOR5JLXIK8BCvjo6dNDYRuoWoA7BaCAQWM4WBH8K3W/VHewRChk
 mwgt8Go29lUyjCJdtShrP7S+i7v1KMxisaChhipnlmKunFxObwrghlzeGJQpw0JXa8p5LbIYY
 glP4vhWjbG9pSAgZt3jA1BtPDBWL42fWc8FbyYH0hdI5pP/vn9VaL0rTpi2fF6Xi05mFTn3YF
 yFRqZXkV9MDNMEeuY2WiGQfClAMSja5wEGASC3PhkI2Lz1tl9rdKfsZhlMrJscf8hLaIHJOLV
 sRUwpTIkc2fl/wXYQVKsmJw3YTJz2WEtWiFXzrmcHBrpoEnOr2SKaNZE7FEbimrZhD2xbxx6b
 V9myLnJwDvgcZHjZmKyYEqNqElIrp/nIiDzmNpbbeyM2aziUJwxzvwcdNb/+iZGjVqEN4+g5M
 tqRJnqLWO8W2C0/z+8Ih7BUAjuYcwyy+i1pDJEKUm+8/r+Bswp6+Jk+LY6p10gIDDbXVQLOrj
 fkWLM6tUNA8BTr2dVOqNvvQ0cOuHssNiCpWn3VD8SHz1NiIA3Q17UYsAwsuEGGrxb84VsaLKB
 t2OzfHsFx11NpsByRjkojwejp+JIOXjGkad7ims3QDvpW2kJh/3Cvnm4wAlrFa7R9wDgK/qx5
 YtzHbkrzv9KDIGNPZe0g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The syntax without dots is available since commit 43756e347f21
("scripts/kernel-doc: Add support for named variable macro arguments").

The same HTML output is produced with and without this patch.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 include/media/dvbdev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/dvbdev.h b/include/media/dvbdev.h
index e547cbeee4310..cc85df91ee7c6 100644
=2D-- a/include/media/dvbdev.h
+++ b/include/media/dvbdev.h
@@ -421,7 +421,7 @@ void dvb_module_release(struct i2c_client *client);
  * dvb_attach - attaches a DVB frontend into the DVB core.
  *
  * @FUNCTION:	function on a frontend module to be called.
- * @ARGS...:	@FUNCTION arguments.
+ * @ARGS:	@FUNCTION arguments.
  *
  * This ancillary function loads a frontend module in runtime and runs
  * the @FUNCTION function there, with @ARGS.
=2D-
2.28.0

