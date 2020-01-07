Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D404D132990
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 16:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgAGPDd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 10:03:33 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:58503 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728274AbgAGPDd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 10:03:33 -0500
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mate1-1jQvAP3sBX-00cNvl; Tue, 07 Jan 2020 16:03:31 +0100
Received: by mail-qk1-f182.google.com with SMTP id w127so42868755qkb.11;
        Tue, 07 Jan 2020 07:03:30 -0800 (PST)
X-Gm-Message-State: APjAAAUZcDZqsBnvCqHjXLq2022+QYAXa1yxiQNBCz+OoxvnzY/w02RF
        JURfhEQuIjxdEYpGwfOrnoVDfI9pBx6EF0ZV3G0=
X-Google-Smtp-Source: APXvYqwxdv3CnMffWGROluzyN8EtJmt7Qv/zjpuKacZX6xIGNgJJhH/toXHoHDyX4yJa7VVmd4RmZ3zE3NyXULry9c8=
X-Received: by 2002:a37:84a:: with SMTP id 71mr85970792qki.138.1578409409535;
 Tue, 07 Jan 2020 07:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20200107084659.uyaucu73yd5rhim3@kili.mountain>
In-Reply-To: <20200107084659.uyaucu73yd5rhim3@kili.mountain>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 7 Jan 2020 16:03:12 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1iUADRcjWEMZjVuCKyESXA7fHEypvFK7vEQ0CseXfmtg@mail.gmail.com>
Message-ID: <CAK8P3a1iUADRcjWEMZjVuCKyESXA7fHEypvFK7vEQ0CseXfmtg@mail.gmail.com>
Subject: Re: [bug report] compat_ioctl: move CDROM_SEND_PACKET handling into scsi
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-block <linux-block@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:1FsIxDl1pZiGty+oj37I5iTjE/qZVUHpt3hmugUi8V6vXM7ipyd
 Kx2fddsPERu70jS9Q9EkbJEbXbEo8nx5SQducp69r+nEOqEU8Rq6sxCpW1pnuk5NAljPZl0
 wn/Y4M5+54VNFmFQB0E1507usrrMsrx9QwJZUjpFgrmpdNumGfrdDMXkq0R+WEDWSkdfi1B
 oJxqLu6GtpbC8nF12ZStg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zF73zkrAZrs=:8qFR+EYK7DfV2ThsNMj2i+
 Do9NH0Id1iCnhXO2bvKjDmke4VMhYq11BkxPYKH69UuJUzke9wS7re2hcHDQN7hkgdJxQvMUD
 N/2PRatm5ch3LJQha67zqOfaCpBaxFqyp+AtuNFujlC+DO6ExLW20zuXsS5Vwm9AmJWaJRIqb
 j+f4UgE18IfGmIEkNRwlftHcY7fnXl+bkaby7RxOOOl2CsHbErRVPWXpXtB6yHxkqeV67Q5u2
 OpFH0w9n9em8o9SnHkfBX+Ra1W//qJ9og+hsL4ZFAprpwv+n/ozlxDB3RgOPT758Q0s21wQNQ
 R7zMg8cMACEFLrW+e6/FaFoTpVUsQ1Aw78ro+7NF4IF06q1xoPyzS1+rnGJYafHp+jGvHjQ2m
 PrFq6ZOdRwHljpv2CQFcLTmjYXC/lK8M5Cwh5Shqpa9TKmRwEAggEOYWVxndtcgkvCpwBF/wl
 yb0B6zDw3Cp/iFfgkUa95LdURUJmtQC7ftiCeZGALRcrqUnbt+TI6g9qF1907yqRMrZFhPuKh
 7LYgaU3kGxJNikUTAKmNYdUPTOSDZdsvOH6mz1CuSE3N+rxJcLitI8rXeteZthzpL8Bckywn/
 zhlNAlQfO+uarE/+21H0YCPDH5qlg/hvRiQM+XmmwlNGsir7k1qoY2kazB4UrHDa6RqxSHkjW
 J6XMZu9+2QBmjBM/cB/I6CvmMLKnFwgfef8VcSCORJQK3t4EB5zPNB2cDji1nQ7e8gf0/BvPv
 bXSI5JK+dGwhhTkuAefm+9+BKg73pYslrcdU+ABswwK+6ZIMDDLHBCSKFSfTggkBOAFa9dbtS
 1RCc4fOGNJzA32NWHRAYsbiOfDvmseKFnhD2aAjqPoRvuHnQGFpKBOhnUPEws5fcvchoyPBy7
 +aAyPk3t3qR9TokhlRIg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 7, 2020 at 9:49 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Arnd Bergmann,
>
> The patch f3ee6e63a9df: "compat_ioctl: move CDROM_SEND_PACKET
> handling into scsi" from Nov 28, 2019, leads to the following static
> checker warning:
>
>         block/scsi_ioctl.c:703 scsi_put_cdrom_generic_arg()
>         warn: check that 'cgc32' doesn't leak information (struct has a hole after 'data_direction')
>
> block/scsi_ioctl.c
>    686  static int scsi_put_cdrom_generic_arg(const struct cdrom_generic_command *cgc,
>    687                                        void __user *arg)
>    688  {
>    689  #ifdef CONFIG_COMPAT
>    690          if (in_compat_syscall()) {
>    691                  struct compat_cdrom_generic_command cgc32 = {
>    692                          .buffer         = (uintptr_t)(cgc->buffer),
>    693                          .buflen         = cgc->buflen,
>    694                          .stat           = cgc->stat,
>    695                          .sense          = (uintptr_t)(cgc->sense),
>    696                          .data_direction = cgc->data_direction,
>    697                          .quiet          = cgc->quiet,
>    698                          .timeout        = cgc->timeout,
>    699                          .reserved[0]    = (uintptr_t)(cgc->reserved[0]),
>    700                  };
>
> It's possible that initializations like this don't clear out the struct
> hole but I haven't seen a compiler which is affected.  So maybe it's
> fine?

I thlought we already rely on this to initialize the entire structure, but
trying out a test case shows that it does happen:

int g(void *);
int f(void)
{
    struct x {
        char a __attribute__((aligned(4096)));
    } x = { .a = 23 };
    return g(&x);
}

0000000000000000 <f>:
   0: 55                    push   %rbp
   1: 48 89 e5              mov    %rsp,%rbp
   4: 48 81 e4 00 f0 ff ff and    $0xfffffffffffff000,%rsp
   b: 48 81 ec 00 10 00 00 sub    $0x1000,%rsp
  12: 48 89 e7              mov    %rsp,%rdi
  15: c6 04 24 17          movb   $0x17,(%rsp)
  19: e8 00 00 00 00        callq  1e <f+0x1e>
1a: R_X86_64_PC32 g-0x4
  1e: c9                    leaveq
  1f: c3                    retq

This patch should reliably fix it, right?

diff --git a/block/scsi_ioctl.c b/block/scsi_ioctl.c
index b4e73d5dd5c2..83a709290b18 100644
--- a/block/scsi_ioctl.c
+++ b/block/scsi_ioctl.c
@@ -647,6 +647,7 @@ struct compat_cdrom_generic_command {
        compat_int_t    stat;
        compat_caddr_t  sense;
        unsigned char   data_direction;
+       char            __pad[3];
        compat_int_t    quiet;
        compat_int_t    timeout;
        compat_caddr_t  reserved[1];

>    701                  memcpy(&cgc32.cmd, &cgc->cmd, CDROM_PACKET_SIZE);
>    702
>    703                  if (copy_to_user(arg, &cgc32, sizeof(cgc32)))
>    704                          return -EFAULT;
>    705
>    706                  return 0;
>    707          }
>    708  #endif
>    709          if (copy_to_user(arg, cgc, sizeof(*cgc)))
>    710                  return -EFAULT;
>    711
>    712          return 0;
>    713  }
>
> See also:
> drivers/media/v4l2-core/v4l2-ioctl.c:3140 video_put_user() warn: check that 'ev32' doesn't leak information (struct has a hole after 'type')
> drivers/media/v4l2-core/v4l2-ioctl.c:3165 video_put_user() warn: check that 'vb32' doesn't leak information (struct has a hole after 'memory')

These get a bit uglier when we try not to change the layout:

diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
index 291ec28cdf6b..6556e8eeb65e 100644
--- a/include/media/v4l2-ioctl.h
+++ b/include/media/v4l2-ioctl.h
@@ -735,6 +735,7 @@ long int video_ioctl2(struct file *file,
  */
 struct v4l2_event_time32 {
        __u32                           type;
+       __u8                            pad[__alignof(__u64) -
__alignof(__u32)];
        union {
                struct v4l2_event_vsync         vsync;
                struct v4l2_event_ctrl          ctrl;
@@ -764,6 +765,7 @@ struct v4l2_buffer_time32 {

        /* memory location */
        __u32                   memory;
+       __u8                    pad[__alignof(void *) - __alignof(__u32)];
        union {
                __u32           offset;
                unsigned long   userptr;

I liked the way the current solution looks, but maybe it's better to use
an explicit memset and compound expression to force the compiler
to do the right thing here. This should also be safe and lead to the
same object code in most cases, right?

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c
b/drivers/media/v4l2-core/v4l2-ioctl.c
index b68ff06009cd..cb1b66463402 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3125,7 +3125,10 @@ static int video_put_user(void __user *arg,
void *parg, unsigned int cmd)
 #ifdef CONFIG_COMPAT_32BIT_TIME
        case VIDIOC_DQEVENT_TIME32: {
                struct v4l2_event *ev = parg;
-               struct v4l2_event_time32 ev32 = {
+               struct v4l2_event_time32 ev32;
+
+               memset(ev32, 0, sizeof(ev32));
+               ev32 = (struct v4l2_event_time32){
                        .type           = ev->type,
                        .pending        = ev->pending,
                        .sequence       = ev->sequence,

        Arnd
