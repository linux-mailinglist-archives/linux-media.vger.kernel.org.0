Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D542B3E8B
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 09:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgKPIYB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 03:24:01 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:58571 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726176AbgKPIYB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 03:24:01 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id eZnnkmOZEfkEdeZnrkVKGi; Mon, 16 Nov 2020 09:23:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605515039; bh=Vzo+l3atyZit31TTuhx8/vun1IQvU/84Ol323CtBfpo=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Te1vPR7a0xmx0tHFktyp38O4iq/5nkgpjkUX6Iw0HG4kUBnh+ripixuaSyZGExjp8
         psbojMfhVqrWfT6ItysdaVO5TWiRuP0cdaiyzr8YDIALj+Ty62/dJMXpSpQkOuaMW8
         RP08W3UfJU8aKi1K2y/g68Q4xhYisKsFinaWCuPhJwesjlJHX1lYUlANly8bXTOmPd
         nl8FEASpy2l2ejpfELTKQhCuCn/+jlxED+99t0bfCDMnWcYM5Es0UYOolf9lEr8B5z
         29cCHc3tqP0CJAd+PxXf8HjsYQdIIAOlRUjhfqoH7qUFIKlOhpZ/m3vmON14qzttot
         moIwM/h0aucDA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] v4l2-compat-ioctl32.c: add missing #ifdef
 CONFIG_COMPAT_32BIT_TIMEs
Message-ID: <0cf705c4-0150-150b-8e29-de15b04ea6cf@xs4all.nl>
Date:   Mon, 16 Nov 2020 09:23:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGEFeb9lGqqsGo0Vfrgu2Ynp9dWGJoAC2AG7odC3SRMLKBKvMhHZOyAX4QmfqfqdThemFrun5ZRG4K7K6vHa2k1Fq1l6zvOMYMpksORtrRx8hQaxl04F
 pWjayFq340V8t46zide05apdkC6pIeQXNohtzSd0ya5AtFhMOCtM2x8Cq4lhZLhoaEVQG6FVhnQTdXONFj1irBFDEqLtl8oxs1ibqGpWmQC2pmoeB/PLvPNF
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In two places time32 structures were defined, but they are not
used if CONFIG_COMPAT_32BIT_TIME is not set. Put these two structs
under #ifdef CONFIG_COMPAT_32BIT_TIME as well to clearly indicate
that they are only used if that config option is set.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes in v2: missed a few #ifdefs causing compile errors if
CONFIG_COMPAT_32BIT_TIME was not set.
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 23 +++++++++++++++----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 58d29284db13..0ca75f6784c5 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -304,6 +304,7 @@ struct v4l2_buffer32 {
 	__s32			request_fd;
 };

+#ifdef CONFIG_COMPAT_32BIT_TIME
 struct v4l2_buffer32_time32 {
 	__u32			index;
 	__u32			type;	/* enum v4l2_buf_type */
@@ -326,6 +327,7 @@ struct v4l2_buffer32_time32 {
 	__u32			reserved2;
 	__s32			request_fd;
 };
+#endif

 static int get_v4l2_plane32(struct v4l2_plane *p64,
 			    struct v4l2_plane32 __user *p32,
@@ -763,6 +765,7 @@ struct v4l2_event32 {
 	__u32				reserved[8];
 };

+#ifdef CONFIG_COMPAT_32BIT_TIME
 struct v4l2_event32_time32 {
 	__u32				type;
 	union {
@@ -775,6 +778,7 @@ struct v4l2_event32_time32 {
 	__u32				id;
 	__u32				reserved[8];
 };
+#endif

 static int put_v4l2_event32(struct v4l2_event *p64,
 			    struct v4l2_event32 __user *p32)
@@ -849,13 +853,10 @@ static int put_v4l2_edid32(struct v4l2_edid *p64,
 #define VIDIOC_G_FMT32		_IOWR('V',  4, struct v4l2_format32)
 #define VIDIOC_S_FMT32		_IOWR('V',  5, struct v4l2_format32)
 #define VIDIOC_QUERYBUF32	_IOWR('V',  9, struct v4l2_buffer32)
-#define VIDIOC_QUERYBUF32_TIME32 _IOWR('V',  9, struct v4l2_buffer32_time32)
 #define VIDIOC_G_FBUF32		_IOR ('V', 10, struct v4l2_framebuffer32)
 #define VIDIOC_S_FBUF32		_IOW ('V', 11, struct v4l2_framebuffer32)
 #define VIDIOC_QBUF32		_IOWR('V', 15, struct v4l2_buffer32)
-#define VIDIOC_QBUF32_TIME32	_IOWR('V', 15, struct v4l2_buffer32_time32)
 #define VIDIOC_DQBUF32		_IOWR('V', 17, struct v4l2_buffer32)
-#define VIDIOC_DQBUF32_TIME32	_IOWR('V', 17, struct v4l2_buffer32_time32)
 #define VIDIOC_ENUMSTD32	_IOWR('V', 25, struct v4l2_standard32)
 #define VIDIOC_ENUMINPUT32	_IOWR('V', 26, struct v4l2_input32)
 #define VIDIOC_G_EDID32		_IOWR('V', 40, struct v4l2_edid32)
@@ -865,10 +866,18 @@ static int put_v4l2_edid32(struct v4l2_edid *p64,
 #define VIDIOC_S_EXT_CTRLS32    _IOWR('V', 72, struct v4l2_ext_controls32)
 #define VIDIOC_TRY_EXT_CTRLS32  _IOWR('V', 73, struct v4l2_ext_controls32)
 #define	VIDIOC_DQEVENT32	_IOR ('V', 89, struct v4l2_event32)
-#define	VIDIOC_DQEVENT32_TIME32	_IOR ('V', 89, struct v4l2_event32_time32)
 #define VIDIOC_CREATE_BUFS32	_IOWR('V', 92, struct v4l2_create_buffers32)
 #define VIDIOC_PREPARE_BUF32	_IOWR('V', 93, struct v4l2_buffer32)
-#define VIDIOC_PREPARE_BUF32_TIME32 _IOWR('V', 93, struct v4l2_buffer32_time32)
+
+#ifdef CONFIG_COMPAT_32BIT_TIME
+#define VIDIOC_QUERYBUF32_TIME32	_IOWR('V',  9, struct v4l2_buffer32_time32)
+#define VIDIOC_QBUF32_TIME32		_IOWR('V', 15, struct v4l2_buffer32_time32)
+#define VIDIOC_DQBUF32_TIME32		_IOWR('V', 17, struct v4l2_buffer32_time32)
+#ifdef CONFIG_X86_64
+#define	VIDIOC_DQEVENT32_TIME32		_IOR ('V', 89, struct v4l2_event32_time32)
+#endif
+#define VIDIOC_PREPARE_BUF32_TIME32	_IOWR('V', 93, struct v4l2_buffer32_time32)
+#endif

 unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 {
@@ -1055,10 +1064,12 @@ int v4l2_compat_get_array_args(struct file *file, void *mbuf,
 		}
 		break;
 	}
+#ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_QUERYBUF32_TIME32:
 	case VIDIOC_QBUF32_TIME32:
 	case VIDIOC_DQBUF32_TIME32:
 	case VIDIOC_PREPARE_BUF32_TIME32:
+#endif
 	case VIDIOC_QUERYBUF32:
 	case VIDIOC_QBUF32:
 	case VIDIOC_DQBUF32:
@@ -1145,10 +1156,12 @@ int v4l2_compat_put_array_args(struct file *file, void __user *user_ptr,
 		}
 		break;
 	}
+#ifdef CONFIG_COMPAT_32BIT_TIME
 	case VIDIOC_QUERYBUF32_TIME32:
 	case VIDIOC_QBUF32_TIME32:
 	case VIDIOC_DQBUF32_TIME32:
 	case VIDIOC_PREPARE_BUF32_TIME32:
+#endif
 	case VIDIOC_QUERYBUF32:
 	case VIDIOC_QBUF32:
 	case VIDIOC_DQBUF32:
-- 
2.28.0


