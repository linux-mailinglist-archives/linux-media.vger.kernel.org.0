Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588802F437C
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 06:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbhAMFFx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 00:05:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbhAMFFw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 00:05:52 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F542C061794;
        Tue, 12 Jan 2021 21:05:12 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id g4so985947ybo.11;
        Tue, 12 Jan 2021 21:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=H2fJ/axecH/6J+gsobPUGUVGWusfX311kFU3BlwJyaw=;
        b=WdUKppHh5qE2nA/G2cqUSZgTE18MWaSdNoakRvX046FhmCZ7Ouqhy11j5jqFhEsx7+
         ZrJk5+BKCXJuiT0CjYMC7Clj/gilwyFxQUF5WR2k2YiShWhoHSF4i2q0s7JZ568PojuG
         PgpVcLcPz9GuBSwWEZecqTVUrWWJpW7fx+pw9DJ0pbhQ1Glj9XEiztH/3Iq66SUQjT4X
         /shzjl/k74NjNNj/SmsXNmQo0yKfdlbeGsIBXm1S7ypGtWq5lLiojgwkF/ImqvfwWHpL
         IchiUjjal3JJ3/GF5ArYvNdyu+7Wb3MzPs3/Y+uQ5l+/lZT67nnyBwWTB0Wv/jigNqqv
         A3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=H2fJ/axecH/6J+gsobPUGUVGWusfX311kFU3BlwJyaw=;
        b=OBVFB2KPBb5BOvfG08lVC/eIlYOZHKuSlVgVOio9OKYwV222sARp+JkC09RZU5cb2G
         WqB9C/BBPG8nPA8LJRzdGbth9iQtTFTGxvL/y4bvdgMtOWpqWmfilgABiourov58f4uK
         HzQXeu9ACjFbfgTswIM0QGm37/KAJKchXVQVi2W8Bto/N/+SgQlnSYx3bMsnV9+7ndlQ
         YpDVghmOJxG47iM+U+hAxlxtJtHRroXhN8uvvhUnGRqTVfX6T03FRCg93cfaZlWUphiA
         YDO43PEk47wH03moS9cPwqlTKJjwnoUf2gtKkPt+dFn4wVlUBt3FY35Pr6k3xOTuaP8A
         SrSg==
X-Gm-Message-State: AOAM5307ZAjKLsfmCxV2AirKkuqfZvpukwhI68ovj0fZZAl4egcC0UBU
        RiOmrCC3HK0ZLDraocQt57Y/3g/Ehmxvi+IU3/FqUU9JpCfvhrnr
X-Google-Smtp-Source: ABdhPJwWR5KSECnDvOvXv6NvLQlRekb3+GXlW2S+NzrNMmuR5ehuW0T0YGRFcXu/k0xODwLSL3lxja4jF5Sj55pjyfU=
X-Received: by 2002:a25:3457:: with SMTP id b84mr796341yba.167.1610514311118;
 Tue, 12 Jan 2021 21:05:11 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Date:   Wed, 13 Jan 2021 13:04:44 +0800
Message-ID: <CAD-N9QW-zm37f9PW-iF-NaAH5LLePWFba3aG5LkXD2a07YBZpg@mail.gmail.com>
Subject: "UBSAN: shift-out-of-bounds in mceusb_dev_recv" should share the same
 root cause with "UBSAN: shift-out-of-bounds in mceusb_dev_printdata"
To:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org,
        anant.thazhemadam@gmail.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Greg KH <greg@kroah.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi developers,

I found that "UBSAN: shift-out-of-bounds in mceusb_dev_recv" and
"UBSAN: shift-out-of-bounds in mceusb_dev_printdata" should share the
same root cause.
The reason is that the PoCs after minimization has a high similarity
with the other. And their stack trace only diverges at the last
function call. The following is some analysis for this bug.

The following code in the mceusb_process_ir_data is the vulnerable
--------------------------------------------------------------------------------------------------------------------------
for (; i < buf_len; i++) {
     switch (ir->parser_state) {
     case SUBCMD:
             ir->rem = mceusb_cmd_datasize(ir->cmd, ir->buf_in[i]);
             mceusb_dev_printdata(ir, ir->buf_in, buf_len, i - 1,
                                                   ir->rem + 2, false);
             if (i + ir->rem < buf_len)
             mceusb_handle_command(ir, &ir->buf_in[i - 1]);
--------------------------------------------------------------------------------------------------------------------------

The first report crashes at a shift operation(1<<*hi) in mceusb_handle_command.
--------------------------------------------------------------------------------------------------------------------------
static void mceusb_handle_command(struct mceusb_dev *ir, u8 *buf_in)
{
u8 *hi = &buf_in[2]; /* read only when required */
if (cmd == MCE_CMD_PORT_SYS) {
      switch (subcmd) {
      case MCE_RSP_GETPORTSTATUS:
              if (buf_in[5] == 0)
                     ir->txports_cabled |= 1 << *hi;
--------------------------------------------------------------------------------------------------------------------------

The second report crashes at another shift operation (1U << data[0])
in mceusb_dev_printdata.
--------------------------------------------------------------------------------------------------------------------------
static void mceusb_dev_printdata(struct mceusb_dev *ir, u8 *buf, int buf_len,
int offset, int len, bool out)
{
data   = &buf[offset] + 2;

          period = DIV_ROUND_CLOSEST((1U << data[0] * 2) *
                        (data[1] + 1), 10);
--------------------------------------------------------------------------------------------------------------------------

From the analysis, we can know the data[0] and *hi access the same
memory cell - ``ir->buf_in[i+1]``. So the root cause should be that it
misses the check of ir->buf_in[i+1].

For the patch of this bug, there is one from anant.thazhemadam@gmail.com:
--------------------------------------------------------------------------------------------------------------------------
diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index f1dbd059ed08..79de721b1c4a 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -1169,7 +1169,7 @@ static void mceusb_handle_command(struct
mceusb_dev *ir, u8 *buf_in)
  switch (subcmd) {
  /* the one and only 5-byte return value command */
  case MCE_RSP_GETPORTSTATUS:
- if (buf_in[5] == 0)
+ if ((buf_in[5] == 0) && (*hi <= 32))
  ir->txports_cabled |= 1 << *hi;
  break;
--------------------------------------------------------------------------------------------------------------------------
I tried this patch in the second crash report and found it does not
work. I think we should add another filter for the value in
``ir->buf_in[i+1]``.

With this grouping, I think developers can take into consideration the
issue in mceusb_dev_printdata and generate a complete patch for this
bug.

If any of my understanding is incorrect or has issues, please let me
know. Thanks very much.

--
My best regards to you.

     No System Is Safe!
     Dongliang Mu
