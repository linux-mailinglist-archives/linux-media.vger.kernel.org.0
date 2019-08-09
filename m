Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3449786F84
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 04:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403994AbfHICJb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 22:09:31 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45696 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfHICJb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 22:09:31 -0400
Received: from [IPv6:2804:431:c7f4:9cf6:d711:794d:1c68:5ed3] (unknown [IPv6:2804:431:c7f4:9cf6:d711:794d:1c68:5ed3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tonyk)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 27165283C5A;
        Fri,  9 Aug 2019 03:09:27 +0100 (BST)
Subject: Re: [PATCH] v4l2-compliance: split node at testNode() in two nodes
To:     hverkuil@xs4all.nl, linux-media@vger.kernel.org
Cc:     kernel@collabora.com
References: <20190809010204.11555-1-andrealmeid@collabora.com>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
Message-ID: <d6b6f5a7-28e1-0842-8f88-0e288fa3083b@collabora.com>
Date:   Thu, 8 Aug 2019 23:08:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809010204.11555-1-andrealmeid@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/8/19 10:02 PM, André Almeida wrote:
> v4l2-compliance tests deals with memory-to-memory devices (m2m) like
> they are a single device, through the struct node. This is indeed the
> most usual case. However, there are m2m devices that have two
> separated devices for the capture queue and for the output queue, and
> the current design does not support they.
> 
> Split the node on testNode and related functions in two arguments:
> struct node node and struct node node_m2m_cap. For now, use the same node in
> both arguments.
> 
> Signed-off-by: André Almeida <andrealmeid@collabora.com>
> ---
> Hello,
> 
> This is an effort to support topologies with video loopback (i.e. an
> output device and a capture in the same media path). A future patch will
> add a new option (--output) to specify the output device to be used with
> the --device to form the loopback. With that option, the arguments node
> and node_m2m_cap would not be the same device, as in this patch.
> I may forgot to replace in some function, please notify my if you find
> something missing.
> 

I believe it also worth saying that I tested the modification with vivid
and vim2m and the tool behave as expected (all tests succeed).

> Thanks,
> 	André
> 
>  utils/v4l2-compliance/v4l2-compliance.cpp   | 20 ++---
>  utils/v4l2-compliance/v4l2-compliance.h     | 22 +++++-
>  utils/v4l2-compliance/v4l2-test-buffers.cpp | 88 +++++++++++----------
>  utils/v4l2-compliance/v4l2-test-media.cpp   |  2 +-
>  4 files changed, 74 insertions(+), 58 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index fbeb96be..d9509064 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -908,7 +908,7 @@ err:
>  	return result;
>  }
>  
> -void testNode(struct node &node, struct node &expbuf_node, media_type type,
> +void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_node, media_type type,
>  	      unsigned frame_count, unsigned all_fmt_frame_count)
>  {
>  	struct node node2;
> @@ -1333,33 +1333,33 @@ void testNode(struct node &node, struct node &expbuf_node, media_type type,
>  			node.reopen();
>  			if (!(node.codec_mask & (STATEFUL_ENCODER | STATEFUL_DECODER))) {
>  				printf("\ttest MMAP (no poll): %s\n",
> -				       ok(testMmap(&node, frame_count, POLL_MODE_NONE)));
> +				       ok(testMmap(&node, &node_m2m_cap, frame_count, POLL_MODE_NONE)));
>  				node.reopen();
>  			}
>  			printf("\ttest MMAP (select): %s\n",
> -			       ok(testMmap(&node, frame_count, POLL_MODE_SELECT)));
> +			       ok(testMmap(&node, &node_m2m_cap, frame_count, POLL_MODE_SELECT)));
>  			node.reopen();
>  			printf("\ttest MMAP (epoll): %s\n",
> -			       ok(testMmap(&node, frame_count, POLL_MODE_EPOLL)));
> +			       ok(testMmap(&node, &node_m2m_cap, frame_count, POLL_MODE_EPOLL)));
>  			node.reopen();
>  			if (!(node.codec_mask & (STATEFUL_ENCODER | STATEFUL_DECODER))) {
>  				printf("\ttest USERPTR (no poll): %s\n",
> -				       ok(testUserPtr(&node, frame_count, POLL_MODE_NONE)));
> +				       ok(testUserPtr(&node, &node_m2m_cap, frame_count, POLL_MODE_NONE)));
>  				node.reopen();
>  			}
>  			printf("\ttest USERPTR (select): %s\n",
> -			       ok(testUserPtr(&node, frame_count, POLL_MODE_SELECT)));
> +			       ok(testUserPtr(&node, &node_m2m_cap, frame_count, POLL_MODE_SELECT)));
>  			node.reopen();
>  			if (options[OptSetExpBufDevice] ||
>  			    !(node.valid_memorytype & (1 << V4L2_MEMORY_DMABUF))) {
>  				if (!(node.codec_mask & (STATEFUL_ENCODER | STATEFUL_DECODER))) {
>  					printf("\ttest DMABUF (no poll): %s\n",
> -					       ok(testDmaBuf(&expbuf_node, &node, frame_count,
> -							     POLL_MODE_NONE)));
> +					       ok(testDmaBuf(&expbuf_node, &node, &node_m2m_cap,
> +							     frame_count, POLL_MODE_NONE)));
>  					node.reopen();
>  				}
>  				printf("\ttest DMABUF (select): %s\n",
> -				       ok(testDmaBuf(&expbuf_node, &node, frame_count, POLL_MODE_SELECT)));
> +				       ok(testDmaBuf(&expbuf_node, &node, &node_m2m_cap, frame_count, POLL_MODE_SELECT)));
>  				node.reopen();
>  			} else if (!options[OptSetExpBufDevice]) {
>  				printf("\ttest DMABUF: Cannot test, specify --expbuf-device\n");
> @@ -1707,7 +1707,7 @@ int main(int argc, char **argv)
>  		}
>  	}
>  
> -	testNode(node, expbuf_node, type, frame_count, all_fmt_frame_count);
> +	testNode(node, node, expbuf_node, type, frame_count, all_fmt_frame_count);
>  
>  	if (!expbuf_device.empty())
>  		expbuf_node.close();
> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
> index 152a6c6d..6aba3828 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.h
> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> @@ -258,7 +258,7 @@ int check_string(const char *s, size_t len);
>  int check_ustring(const __u8 *s, int len);
>  int check_0(const void *p, int len);
>  int restoreFormat(struct node *node);
> -void testNode(struct node &node, struct node &expbuf_node, media_type type,
> +void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_node, media_type type,
>  	      unsigned frame_count, unsigned all_fmt_frame_count);
>  std::string stream_from(std::string pixelformat, bool &use_hdr);
>  
> @@ -331,9 +331,23 @@ int testReqBufs(struct node *node);
>  int testReadWrite(struct node *node);
>  int testExpBuf(struct node *node);
>  int testBlockingWait(struct node *node);
> -int testMmap(struct node *node, unsigned frame_count, enum poll_mode pollmode);
> -int testUserPtr(struct node *node, unsigned frame_count, enum poll_mode pollmode);
> -int testDmaBuf(struct node *expbuf_node, struct node *node, unsigned frame_count,
> +/*
> + * struct node node:
> + * 	the current media node being tested
> + *
> + * struct node node_m2m_cap:
> + * 	the capture device to be used when testing loopback or m2m, for
> + * 	instance, if the node we are testing is m2m, then node == node_m2m_cap,
> + * 	but if we have a topology like output->capture, node will be the output
> + * 	and node_m2m_cap will be the capture device that v4l2-compliance will
> + * 	use to test the loop
> + */
> +int testMmap(struct node *node, struct node *node_m2m_cap, unsigned frame_count,
> +	     enum poll_mode pollmode);
> +int testUserPtr(struct node *node, struct node *node_m2m_cap,
> +		unsigned frame_count, enum poll_mode pollmode);
> +int testDmaBuf(struct node *expbuf_node, struct node *node,
> +	       struct node *node_m2m_cap, unsigned frame_count,
>  	       enum poll_mode pollmode);
>  int testRequests(struct node *node, bool test_streaming);
>  void streamAllFormats(struct node *node, unsigned frame_count);
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index fefe3e7b..029d0ed0 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -836,7 +836,7 @@ static int setupM2M(struct node *node, cv4l_queue &q, bool init = true)
>  	return 0;
>  }
>  
> -static int captureBufs(struct node *node, const cv4l_queue &q,
> +static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_queue &q,
>  		cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
>  		unsigned &capture_count)
>  {
> @@ -885,8 +885,8 @@ static int captureBufs(struct node *node, const cv4l_queue &q,
>  		V4L2_FMT_FLAG_COMPRESSED)
>  		valid_output_flags = V4L2_BUF_FLAG_TIMECODE | V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
>  	if (node->is_m2m) {
> -		node->g_fmt(fmt_q, m2m_q.g_type());
> -		if (node->buftype_pixfmts[m2m_q.g_type()][fmt_q.g_pixelformat()] &
> +		node_m2m_cap->g_fmt(fmt_q, m2m_q.g_type());
> +		if (node_m2m_cap->buftype_pixfmts[m2m_q.g_type()][fmt_q.g_pixelformat()] &
>  			V4L2_FMT_FLAG_COMPRESSED)
>  			valid_output_flags = V4L2_BUF_FLAG_TIMECODE | V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
>  
> @@ -1045,7 +1045,7 @@ static int captureBufs(struct node *node, const cv4l_queue &q,
>  
>  		buf.init(m2m_q);
>  		do {
> -			ret = buf.dqbuf(node);
> +			ret = buf.dqbuf(node_m2m_cap);
>  		} while (ret == EAGAIN);
>  		capture_count++;
>  
> @@ -1072,16 +1072,16 @@ static int captureBufs(struct node *node, const cv4l_queue &q,
>  		}
>  		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
>  		if (!count || stopped) {
> -			if (!(node->codec_mask & (STATEFUL_ENCODER | STATEFUL_DECODER)))
> +			if (!(node_m2m_cap->codec_mask & (STATEFUL_ENCODER | STATEFUL_DECODER)))
>  				break;
>  			if (buf.g_flags() & V4L2_BUF_FLAG_LAST) {
> -				fail_on_test(buf.dqbuf(node) != EPIPE);
> +				fail_on_test(buf.dqbuf(node_m2m_cap) != EPIPE);
>  				fail_on_test(!got_eos && !got_source_change);
>  				if (!count)
>  					break;
> -				fail_on_test(node->streamoff(m2m_q.g_type()));
> -				m2m_q.munmap_bufs(node);
> -				fail_on_test(setupM2M(node, m2m_q, false));
> +				fail_on_test(node_m2m_cap->streamoff(m2m_q.g_type()));
> +				m2m_q.munmap_bufs(node_m2m_cap);
> +				fail_on_test(setupM2M(node_m2m_cap, m2m_q, false));
>  				stopped = false;
>  				got_source_change = false;
>  
> @@ -1089,12 +1089,12 @@ static int captureBufs(struct node *node, const cv4l_queue &q,
>  
>  				memset(&cmd, 0, sizeof(cmd));
>  				cmd.cmd = V4L2_DEC_CMD_START;
> -				fail_on_test(doioctl(node, VIDIOC_DECODER_CMD, &cmd));
> +				fail_on_test(doioctl(node_m2m_cap, VIDIOC_DECODER_CMD, &cmd));
>  				continue;
>  			}
>  		}
>  		buf.s_flags(buf.g_flags() & ~V4L2_BUF_FLAG_REQUEST_FD);
> -		fail_on_test(buf.qbuf(node, m2m_q));
> +		fail_on_test(buf.qbuf(node_m2m_cap, m2m_q));
>  		// If the queued buffer is immediately returned as a last
>  		// empty buffer, then FLAG_DONE is set here.
>  		// Need to look at this more closely.
> @@ -1210,7 +1210,8 @@ static int setupMmap(struct node *node, cv4l_queue &q)
>  	return 0;
>  }
>  
> -int testMmap(struct node *node, unsigned frame_count, enum poll_mode pollmode)
> +int testMmap(struct node *node, struct node *node_m2m_cap, unsigned frame_count,
> +	     enum poll_mode pollmode)
>  {
>  	bool can_stream = node->g_caps() & V4L2_CAP_STREAMING;
>  	bool have_createbufs = true;
> @@ -1338,15 +1339,15 @@ int testMmap(struct node *node, unsigned frame_count, enum poll_mode pollmode)
>  				fail_on_test(ev.type != V4L2_EVENT_SOURCE_CHANGE);
>  				fail_on_test(!(ev.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION));
>  			}
> -			fail_on_test(setupM2M(node, m2m_q));
> +			fail_on_test(setupM2M(node_m2m_cap, m2m_q));
>  		}
>  
> -		fail_on_test(captureBufs(node, q, m2m_q, frame_count,
> +		fail_on_test(captureBufs(node, node_m2m_cap, q, m2m_q, frame_count,
>  					 pollmode, capture_count));
>  		fail_on_test(node->streamoff(q.g_type()));
>  		fail_on_test(node->streamoff(q.g_type()));
>  		if (node->is_m2m)
> -			fail_on_test(node->streamoff(m2m_q.g_type()));
> +			fail_on_test(node_m2m_cap->streamoff(m2m_q.g_type()));
>  
>  		if (node->codec_mask & STATEFUL_ENCODER) {
>  			struct v4l2_encoder_cmd cmd;
> @@ -1357,7 +1358,7 @@ int testMmap(struct node *node, unsigned frame_count, enum poll_mode pollmode)
>  
>  			/* No buffers are queued, call STREAMON, then STOP */
>  			fail_on_test(node->streamon(q.g_type()));
> -			fail_on_test(node->streamon(m2m_q.g_type()));
> +			fail_on_test(node_m2m_cap->streamon(m2m_q.g_type()));
>  			fail_on_test(doioctl(node, VIDIOC_ENCODER_CMD, &cmd));
>  
>  			fail_on_test(buf_cap.querybuf(node, 0));
> @@ -1367,11 +1368,11 @@ int testMmap(struct node *node, unsigned frame_count, enum poll_mode pollmode)
>  			for (unsigned p = 0; p < buf_cap.g_num_planes(); p++)
>  				fail_on_test(buf_cap.g_bytesused(p));
>  			fail_on_test(node->streamoff(q.g_type()));
> -			fail_on_test(node->streamoff(m2m_q.g_type()));
> +			fail_on_test(node_m2m_cap->streamoff(m2m_q.g_type()));
>  
>  			/* Call STREAMON, queue one CAPTURE buffer, then STOP */
>  			fail_on_test(node->streamon(q.g_type()));
> -			fail_on_test(node->streamon(m2m_q.g_type()));
> +			fail_on_test(node_m2m_cap->streamon(m2m_q.g_type()));
>  			fail_on_test(buf_cap.querybuf(node, 0));
>  			fail_on_test(buf_cap.qbuf(node));
>  			fail_on_test(doioctl(node, VIDIOC_ENCODER_CMD, &cmd));
> @@ -1381,7 +1382,7 @@ int testMmap(struct node *node, unsigned frame_count, enum poll_mode pollmode)
>  			for (unsigned p = 0; p < buf_cap.g_num_planes(); p++)
>  				fail_on_test(buf_cap.g_bytesused(p));
>  			fail_on_test(node->streamoff(q.g_type()));
> -			fail_on_test(node->streamoff(m2m_q.g_type()));
> +			fail_on_test(node_m2m_cap->streamoff(m2m_q.g_type()));
>  		}
>  
>  		if (node->codec_mask & STATEFUL_DECODER) {
> @@ -1393,7 +1394,7 @@ int testMmap(struct node *node, unsigned frame_count, enum poll_mode pollmode)
>  
>  			/* No buffers are queued, call STREAMON, then STOP */
>  			fail_on_test(node->streamon(q.g_type()));
> -			fail_on_test(node->streamon(m2m_q.g_type()));
> +			fail_on_test(node_m2m_cap->streamon(m2m_q.g_type()));
>  			fail_on_test(doioctl(node, VIDIOC_DECODER_CMD, &cmd));
>  
>  			fail_on_test(buf_cap.querybuf(node, 0));
> @@ -1403,11 +1404,11 @@ int testMmap(struct node *node, unsigned frame_count, enum poll_mode pollmode)
>  			for (unsigned p = 0; p < buf_cap.g_num_planes(); p++)
>  				fail_on_test(buf_cap.g_bytesused(p));
>  			fail_on_test(node->streamoff(q.g_type()));
> -			fail_on_test(node->streamoff(m2m_q.g_type()));
> +			fail_on_test(node_m2m_cap->streamoff(m2m_q.g_type()));
>  
>  			/* Call STREAMON, queue one CAPTURE buffer, then STOP */
>  			fail_on_test(node->streamon(q.g_type()));
> -			fail_on_test(node->streamon(m2m_q.g_type()));
> +			fail_on_test(node_m2m_cap->streamon(m2m_q.g_type()));
>  			fail_on_test(buf_cap.querybuf(node, 0));
>  			fail_on_test(buf_cap.qbuf(node));
>  			fail_on_test(doioctl(node, VIDIOC_DECODER_CMD, &cmd));
> @@ -1417,7 +1418,7 @@ int testMmap(struct node *node, unsigned frame_count, enum poll_mode pollmode)
>  			for (unsigned p = 0; p < buf_cap.g_num_planes(); p++)
>  				fail_on_test(buf_cap.g_bytesused(p));
>  			fail_on_test(node->streamoff(q.g_type()));
> -			fail_on_test(node->streamoff(m2m_q.g_type()));
> +			fail_on_test(node_m2m_cap->streamoff(m2m_q.g_type()));
>  		}
>  
>  		if (node->supports_orphaned_bufs) {
> @@ -1436,15 +1437,15 @@ int testMmap(struct node *node, unsigned frame_count, enum poll_mode pollmode)
>  		if (node->is_m2m) {
>  			if (node->supports_orphaned_bufs) {
>  				fail_on_test(m2m_q.reqbufs(node, 0));
> -				m2m_q.munmap_bufs(node);
> +				m2m_q.munmap_bufs(node_m2m_cap);
>  			} else if (m2m_q.reqbufs(node, 0) != EBUSY) {
>  				// It's either a bug or this driver should set
>  				// V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS
>  				warn("Can free buffers even if still mmap()ed\n");
>  				q.munmap_bufs(node);
>  			} else {
> -				m2m_q.munmap_bufs(node);
> -				fail_on_test(m2m_q.reqbufs(node, 0));
> +				m2m_q.munmap_bufs(node_m2m_cap);
> +				fail_on_test(m2m_q.reqbufs(node_m2m_cap, 0));
>  			}
>  			fail_on_test(!capture_count);
>  		}
> @@ -1528,7 +1529,8 @@ static int setupUserPtr(struct node *node, cv4l_queue &q)
>  	return 0;
>  }
>  
> -int testUserPtr(struct node *node, unsigned frame_count, enum poll_mode pollmode)
> +int testUserPtr(struct node *node, struct node *node_m2m_cap, unsigned frame_count,
> +		enum poll_mode pollmode)
>  {
>  	bool can_stream = node->g_caps() & V4L2_CAP_STREAMING;
>  	int type;
> @@ -1592,16 +1594,16 @@ int testUserPtr(struct node *node, unsigned frame_count, enum poll_mode pollmode
>  				fail_on_test(ev.type != V4L2_EVENT_SOURCE_CHANGE);
>  				fail_on_test(!(ev.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION));
>  			}
> -			fail_on_test(setupM2M(node, m2m_q));
> +			fail_on_test(setupM2M(node_m2m_cap, m2m_q));
>  		}
> -		fail_on_test(captureBufs(node, q, m2m_q, frame_count,
> +		fail_on_test(captureBufs(node, node_m2m_cap, q, m2m_q, frame_count,
>  					 pollmode, capture_count));
>  		fail_on_test(node->streamoff(q.g_type()));
>  		fail_on_test(node->streamoff(q.g_type()));
>  		if (node->is_m2m) {
> -			fail_on_test(node->streamoff(m2m_q.g_type()));
> -			m2m_q.munmap_bufs(node);
> -			fail_on_test(m2m_q.reqbufs(node, 0));
> +			fail_on_test(node_m2m_cap->streamoff(m2m_q.g_type()));
> +			m2m_q.munmap_bufs(node_m2m_cap);
> +			fail_on_test(m2m_q.reqbufs(node_m2m_cap, 0));
>  			fail_on_test(!capture_count);
>  		}
>  		stream_close();
> @@ -1670,7 +1672,7 @@ static int setupDmaBuf(struct node *expbuf_node, struct node *node,
>  	return 0;
>  }
>  
> -int testDmaBuf(struct node *expbuf_node, struct node *node,
> +int testDmaBuf(struct node *expbuf_node, struct node *node, struct node *node_m2m_cap,
>  	       unsigned frame_count, enum poll_mode pollmode)
>  {
>  	bool can_stream = node->g_caps() & V4L2_CAP_STREAMING;
> @@ -1746,9 +1748,9 @@ int testDmaBuf(struct node *expbuf_node, struct node *node,
>  				fail_on_test(ev.type != V4L2_EVENT_SOURCE_CHANGE);
>  				fail_on_test(!(ev.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION));
>  			}
> -			fail_on_test(setupM2M(node, m2m_q));
> +			fail_on_test(setupM2M(node_m2m_cap, m2m_q));
>  		}
> -		fail_on_test(captureBufs(node, q, m2m_q, frame_count,
> +		fail_on_test(captureBufs(node, node_m2m_cap, q, m2m_q, frame_count,
>  					 pollmode, capture_count));
>  		fail_on_test(node->streamoff(q.g_type()));
>  		fail_on_test(node->streamoff(q.g_type()));
> @@ -1765,18 +1767,18 @@ int testDmaBuf(struct node *expbuf_node, struct node *node,
>  			fail_on_test(q.reqbufs(node, 0));
>  		}
>  		if (node->is_m2m) {
> -			fail_on_test(node->streamoff(m2m_q.g_type()));
> -			if (node->supports_orphaned_bufs) {
> +			fail_on_test(node_m2m_cap->streamoff(m2m_q.g_type()));
> +			if (node_m2m_cap->supports_orphaned_bufs) {
>  				fail_on_test(m2m_q.reqbufs(node, 0));
> -				m2m_q.munmap_bufs(node);
> -			} else if (m2m_q.reqbufs(node, 0) != EBUSY) {
> +				m2m_q.munmap_bufs(node_m2m_cap);
> +			} else if (m2m_q.reqbufs(node_m2m_cap, 0) != EBUSY) {
>  				// It's either a bug or this driver should set
>  				// V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS
>  				warn("Can free buffers even if still mmap()ed\n");
>  				q.munmap_bufs(node);
>  			} else {
> -				m2m_q.munmap_bufs(node);
> -				fail_on_test(m2m_q.reqbufs(node, 0));
> +				m2m_q.munmap_bufs(node_m2m_cap);
> +				fail_on_test(m2m_q.reqbufs(node_m2m_cap, 0));
>  			}
>  			fail_on_test(!capture_count);
>  		}
> @@ -2086,7 +2088,7 @@ int testRequests(struct node *node, bool test_streaming)
>  	if (test_streaming) {
>  		unsigned capture_count;
>  
> -		fail_on_test(captureBufs(node, q, m2m_q, num_bufs,
> +		fail_on_test(captureBufs(node, node, q, m2m_q, num_bufs,
>  					 POLL_MODE_SELECT, capture_count));
>  	}
>  	fail_on_test(node->streamoff(q.g_type()));
> @@ -2824,7 +2826,7 @@ static void streamM2MRun(struct node *node, unsigned frame_count)
>  	       fcc2s(cap_fmt.g_pixelformat()).c_str(),
>  	       pixfmt2s(cap_fmt.g_pixelformat()).c_str(),
>  	       cap_fmt.g_width(), cap_fmt.g_height(),
> -	       ok(testMmap(node, frame_count, POLL_MODE_SELECT)));
> +	       ok(testMmap(node, node, frame_count, POLL_MODE_SELECT)));
>  }
>  
>  static int streamM2MOutFormat(struct node *node, __u32 pixelformat, __u32 w, __u32 h,
> diff --git a/utils/v4l2-compliance/v4l2-test-media.cpp b/utils/v4l2-compliance/v4l2-test-media.cpp
> index 03314b9d..a8b84b9a 100644
> --- a/utils/v4l2-compliance/v4l2-test-media.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-media.cpp
> @@ -601,7 +601,7 @@ void walkTopology(struct node &node, struct node &expbuf_node,
>  			continue;
>  		}
>  
> -		testNode(test_node, expbuf_node, type,
> +		testNode(test_node, test_node, expbuf_node, type,
>  			 frame_count, all_fmt_frame_count);
>  		test_node.close();
>  	}
> 

